---
layout: post
title: Mass and Sacrament Times on the Archdiocese of St. Louis' Website
author: geerlingguy
nid: 373
comments: true
redirect_from: /blog/oscatholic/mass-and-sacrament-times/
created: 1297355665
---
One question I'm often asked by many other diocesan web development teams/individuals is how we put together our online Mass Time search (also used for searching adoration and reconciliation times). We also get questions about how we do our online mapping—but I've already covered that (see: [Beautiful, Easy Maps in Drupal using Views and Mapstraction](/blog/oscatholic/beautiful-easy-maps-drup)).

<p style="text-align: center;"><a href="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/search-for-mass-time-ash-wednesday.png"><img src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/imagecache/300px-by-300px/user-uploads/oscatholic/search-for-mass-time-ash-wednesday.png" alt="Mass Times Search Interface" style="border: 0px initial initial;" class="imagecache-300px-by-300px" /></a><br />The Archdiocesan <a href="http://archstl.org/parishes/mass-times">Mass Times search</a> interface (click to enlarge)</p>

We already have a database provided by the Archdiocesan IT department (they maintain it with the help of our diocesan Parish Support staff, and parish secretaries who can update their own schedules and information), so we needed to do the following on the web:

  - Import all the Sacrament time information and attach it to a parish node (so times/days could be affiliated with parishes).
  - Display the time information on parish node pages, in a meaningful way.
  - Allow users to search by Sacrament times, showing parishes on a map, and showing the Sacrament times in a list under the map.

I'll cover each of these important aspects of our website's functionality below.

_Preliminary note: much of this code was provided originally by the great folks at [Palantir](http://www.palantir.net/), who helped us set up this and many other features on the Archdiocesan website..._

## Importing time information, attaching it to Parish nodes

The first step in the process is importing some 3,000+ parish event nodes (which contain data for each 'event' - the event time, the event type (Mass/Reconciliation/Adoration), whether the event is a 'Normal Service' or a special kind of Mass, the location of the event (often in a side chapel or somewhere else), the event day, and the reference for the parish to which the event is attached.

Our site uses the [Migrate](http://drupal.org/project/migrate) module to import all the data, and we have the module set up to import all the events first, then import the Parishes, attaching the events to parishes (through custom code) using a node reference.

The CSV file containing the parish event data contains over 3,000 lines of information like the following:

    29,"362",1,37,48,"07:30","",0,"","English"

Our migrate import takes that line, creates a new node with the information, then later, while importing parish nodes, attaches all event nodes affiliated with that parish to the parish node itself. Then, as they say, the magic happens (via a nodereference field).

Here's the code we use to prepare our parish event node via the migrate import process:

{% highlight php %}
function dir_migrate_prep_parish_event(&$node, $tblinfo, $row) {
  // Just stick on a filler title
  $node->title = "Parish event #" . $row->peventkey;

  // Normalize the dates
  $node->field_event_start[0]['value'] = (int) substr(str_replace(':', '', $row->jos_dir_paevents_evtime), 0, 4);
  $node->field_event_end[0]['value'] = (int) substr(str_replace(':', '', $row->jos_dir_paevents_evendtime), 0, 4);

  // Add taxo from event types
  $mt = dir_migrate_get_map_table('pe-type');
  $term = taxonomy_get_term(db_result(db_query("SELECT destid FROM $mt WHERE sourceid = %d", $row->jos_dir_paevents_fkpesptypekey)));
  if ($term) {
    $node->taxonomy[$term->tid] = $term;
  }

  // Add taxo from event days
  $mt = dir_migrate_get_map_table('pe-time');
  $term = taxonomy_get_term(db_result(db_query("SELECT destid FROM $mt WHERE sourceid = %d", $row->jos_dir_paevents_fkevday)));
  if ($term) {
    $node->taxonomy[$term->tid] = $term;
  }
}
{% endhighlight %}

We basically sanitize the dates coming in from the database (we want them in standard time/0000 format), and then we add taxonomy terms to the dates.
While importing parish nodes, among other things, we attach the parish event nid to the parish node's masstimes/adorationtimes/reconciliationtimes nodereference fields:

{% highlight php %}
$mt = dir_migrate_get_map_table('parish-event');
$fields = dir_migrate_evtype_field_mapping();
$result = db_query("SELECT mt.destid AS nid, e.fkpettypekey AS type
  FROM jos_dir_parish AS p
  INNER JOIN jos_dir_paevents AS e ON p.pnumber = e.fkpnumber
  INNER JOIN $mt AS mt ON e.peventkey = mt.sourceid
  WHERE p.pnumber = %d", $row->jos_dir_parish_pnumber);

while ($record = db_fetch_object($result)) {
  $node->{$fields[$record->type]}[] = array('nid' => $record->nid);
}
{% endhighlight %}

## Displaying Event Time Information in the Nodes
To display the time information in a particular node, we simply did a bit of theming magic. It's not the most highly performant bit of code in the world, but it works.
First, we set up a field_formatter and theme function for parish event times (the following code samples are all from our site's custom.module):

{% highlight php %}
/**
 * Implementation of hook_field_formatter_info()
 */
function custom_field_formatter_info() {
  return array(
    'parish_event_times' => array(
      'label' => 'Parish Event Times',
      'field types' => array('nodereference'),
      'multiple values' => CONTENT_HANDLE_MODULE,
    ),
  );
}

/**
 * Implementation of hook_theme().
 */
function custom_theme() {
  return array(
    'custom_formatter_parish_event_times' => array(
      'arguments' => array('element'),
    ),
  );
}
{% endhighlight %}

These two functions just tell Drupal that we're defining a custom display formatter for parish event times (that can be used in Views, on node teasers, and in full node displays), and then defines a theme function in which we'll tell drupal how to format everything for display.

This next function is a doozy - it basically does all the display dirtywork, and causes a performance burden on the site—if we tried displaying the mass time information for all 200 parish nodes on the site at once, the queries/processing would probably take 20-30 seconds! Therefore, we cache everything aggressively so people don't have to wait for the following theme function to do its work—after it's been done once in a day, it doesn't have to go again, as we cache the resulting page for 18 hours.

{% highlight php %}
/**
 * Theming function for the "Parish Event Times" formatter.
 */
function theme_custom_formatter_parish_event_times($element) {
  $days = array();

  // @TODO - Order the $element's children by day order from the taxonomy sort, then by time
  // @SEE - http://archstldev.com/node/521

  // Loop through all the parish event times, and build a nice array
  // of days and the (multiple) corresponding times
  foreach (element_children($element) as $key) {
    // Load the node
    $node = node_load($element[$key]['#item']['nid']);

    // Parse and format the time
    // Pad start time with leading zero if only 3 digits
    if (strlen($node->field_event_start[0]['value']) == 3) {
      $node->field_event_start[0]['value'] = '0'.$node->field_event_start[0]['value'];
    }
    // Account for perpetual adoration start time of '0' (midnight)
    if (strlen($node->field_event_start[0]['value']) == 1) {
      $node->field_event_start[0]['value'] = '0000';
    }
    // Pad end time with leading zero if only 3 digits
    if (strlen($node->field_event_end[0]['value']) == 3) {
      $node->field_event_end[0]['value'] = '0'.$node->field_event_end[0]['value'];
    }
    // Account for perpetual adoration end time of '2400' (midnight)
    if ($node->field_event_end[0]['value'] == '2400') {
      $node->field_event_end[0]['value'] = '2359';
    }
    $time = date('g:i a', strtotime($node->field_event_start[0]['value']));
    if ($node->field_event_end[0]['value'] > 0) {
      $time .= ' &ndash; '.date('g:i a', strtotime($node->field_event_end[0]['value']));
    }

    // Node contains taxonomy
    if (!empty($node->taxonomy)) {
      $time_data = array();
      // Add event type (if not "Normal Service")
      foreach ($node->taxonomy as $term) {
        if ($term->vid == 24 and $term->name != 'Normal Service') {
          $time_data[] = $term->name;
        }
      }
      // Also add event language (if not "English")
      if (!empty($node->field_event_lang[0]['value']) and $node->field_event_lang[0]['value'] != 'English') {
        $time_data[] = $node->field_event_lang[0]['value'];
      }
      // Add event location (if any) from the field_event_loc
      if (!empty($node->field_event_loc[0]['value'])) {
        $time_data[] = '<em>in ' . $node->field_event_loc[0]['value'] . '</em>';
      }
      // Slap it on the end of the time
      if (!empty($time_data)) {
        $time .= ' ('.join(' - ', $time_data).')';
      }
    }

    // Day of the week
    foreach ((array)$node->taxonomy as $term) {
      if ($term->vid == 21) {
        // Grab the weight of the term for sorting (see below)
        $days[$term->name]['weight'] = $term->weight;
        // Grab all the times
        $days[$term->name]['times'][] = $time;
        break;
      }
    }
  }

  // Sort the Days using the weight above (this could be improved...)
  // @see http://archstldev.com/node/521
  asort($days);

  // Print the days and times
  $output = '<dl class="parish-event-time">';
  foreach ($days as $day => $elements) {
    foreach ($elements['times'] as &$time) {
      $time = '<div>'.$time.'</div>';
    }
    $output .= '<dt>'.$day.'</dt>';
    $output .= '<dd>'.implode('', $elements['times']).'</dd>';
  }
  $output .= '</dl>';
  return $output;
}
{% endhighlight %}

What we basically do here is load each referenced node, then grab all the metadata for that parish event from the parish event node. Then, we display all the metadata in a nice definition list, which gets themed to look like the following:

<p style="text-align: center;"><img src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/mass-times-display.png" alt="Sacramental Time Information Display on Parish Node" width="600" height="251" /></p>

Looks nice, eh? Using the asort() function, we were able to <a href="http://archstldev.com/node/574">sort the times in the order of our Taxonomy</a> listing (so we could control which days would appear first...).

## Allow Users to Search by Time/Day using Views

The final step in the process was to allow users to search on the website by Mass Time (or other Sacrament times), and since we were using Views for all our other search/filtering needs, we decided to use Views to do the time search as well.
Inside our `dir_migrate.module` (though this could live just as easily in our custom.module), we added a views handler, `dir_migrate_views_handler_filter_inttime`.

In `dir_migrate/dir_migrate.module`:

{% highlight php %}
/**
 * Implementation of hook_views_api().
 */
function dir_migrate_views_api() {
  return array(
    'api' => '2.0',
    'path' => drupal_get_path('module', 'dir_migrate') . '/views',
  );
}
{% endhighlight %}

In `dir_migrate/views/dir_migrate.views.inc`:

{% highlight php %}
function dir_migrate_views_handlers() {
  return array(
    'info' => array(
      'path' => drupal_get_path('module', 'dir_migrate') . '/views',
    ),
    'handlers' => array(
      'dir_migrate_views_handler_filter_inttime' => array(
        'parent' => 'views_handler_filter_numeric',
      ),
    ),
  );
}

function dir_migrate_views_data_alter(&$data) {
  $data['node_data_field_event_start2'] = $data['node_data_field_event_start'];
  $field = &$data['node_data_field_event_start2']['field_event_start_value'];
  unset($field['field'], $field['argument'], $field['sort']);
  $field['title'] = t('Start Time (Formatted)');
  $field['help'] = t('Filter handler that translates from int storage to time of day');
  $field['filter']['handler'] = 'dir_migrate_views_handler_filter_inttime';
}
{% endhighlight %}

In `dir_migrate/views/dir_migrate_views_handler_filter_inttime.inc` (this is where we define our custom views filter...):

{% highlight php %}
class dir_migrate_views_handler_filter_inttime extends views_handler_filter_numeric {
  function option_definition() {
    $options = parent::option_definition();
    $options['operator'] = array('default' => 'between');
    $options['exposed'] = array('default' => TRUE);
    $options['value']['contains']['min'] = array('default' => 500);
    $options['value']['contains']['max'] = array('default' => 2200);
    return $options;
  }

  function operators() {
    return array(
      'between' => array(
        'title' => t('Is between'),
        'method' => 'op_between',
        'short' => t('between'),
        'values' => 2,
      ),
    );
  }

  function value_form(&$form, &$form_state) {
    // Get the basic loadout from the parent
    parent::value_form(&$form, &$form_state);

    $options = int_time_increments_assoc();

    // Make the minor modifications
    $form['value']['min'] = array(
      '#type' => 'select',
      '#title' => t('Between'),
      '#options' => $options,
      '#default_value' => $this->value['min'],
    );
    $form['value']['max'] = array(
      '#type' => 'select',
      '#title' => t('And'),
      '#options' => $options,
      '#default_value' => $this->value['max'],
    );
  }
}
{% endhighlight %}

...and finally, some helpful functions for our integer/time CCK field/formatting, found in `dir_migrate/dir_migrate.module`:

{% highlight php %}
// ==================== CCK Bits

function int_time_theme() {
  return array(
    'int_time' => array('arguments' => array('element' => NULL)),
    'int_time_formatter_default' => array('arguments' => array('element' => NULL), 'function' => 'theme_int_time_generic'),
  );
}

function theme_int_time($element) {
  return $element['#children'];
}
/**
* Declare information about a formatter.
*
* @return
*   An array keyed by formatter name. Each element of the array is an associative
*   array with these keys and values:
*   - "label": The human-readable label for the formatter.
*   - "field types": An array of field type names that can be displayed using
*     this formatter.
*/
function int_time_field_formatter_info() {
  return array(
    'default' => array(
      'label' => t('As time of day'),
      'field types' => array('number_integer'),
    ),
  );
}

function theme_int_time_generic($element) {
  return int_time_int_as_time($element['#item']['value']);
}

function int_time_int_as_time($int) {
  $string = (string) $int;

  if (empty($string)) {
    return '';
  }
  while (strlen($string) < 4) {
    $string = '0' . $string;
  }

  list($hour, $minute) = str_split($string, 2);
  if ((int) $hour >= 12) {
    $ex = 'PM';
    $hour -= 12;
  }
  else {
    $ex = 'AM';
  }
  $hour = ltrim($hour, '0');
  $hour = empty($hour) ? '12' : $hour;

  return "$hour:$minute $ex";
}

/**
 * Helper function to return all possible inttimes in 15-minute increments.
 */
function int_time_increments() {
  return array(
    0, 15, 30, 45,
    100, 115, 130, 145,
    200, 215, 230, 245,
    300, 315, 330, 345,
    400, 415, 430, 445,
    500, 515, 530, 545,
    600, 615, 630, 645,
    700, 715, 730, 745,
    800, 815, 830, 845,
    900, 915, 930, 945,
    1000, 1015, 1030, 1045,
    1100, 1115, 1130, 1145,
    1200, 1215, 1230, 1245,
    1300, 1315, 1330, 1345,
    1400, 1415, 1430, 1445,
    1500, 1515, 1530, 1545,
    1600, 1615, 1630, 1645,
    1700, 1715, 1730, 1745,
    1800, 1815, 1830, 1845,
    1900, 1915, 1930, 1945,
    2000, 2015, 2030, 2045,
    2100, 2115, 2130, 2145,
    2200, 2215, 2230, 2245,
    2300, 2315, 2330, 2345
  );
}

function int_time_increments_assoc() {
  static $assoc;
  if (is_null($assoc)) {
    $assoc = array();
    foreach (int_time_increments() as $int) {
      $assoc[$int] = int_time_int_as_time($int);
    }
  }
  return $assoc;
}
{% endhighlight %}

_Wow... this is probably the longest post/code-dump I've ever written... sorry about that! Complex issues demand complex solutions, I guess?_

## Some Things Could Be Improved...

Well, actually, a _lot_ of things could be improved. For instance, we could avoid a lot of this custom code if there were a way to create Date fields without a month or year attached—basically, a timestamp without a fully-compliant 'date' attached to it—but this is currently not possible.

Right now, I'm focusing on a few other projects, but someday I really want to tackle issue #499 on our internal tracker: _Create timefield module for Time CCK/Field_. I envision a module that allows you to add time information to a node like "Saturday, from 4 p.m. to 5 p.m.," and then be able to filter Views results by time values alone... but I don't know if/when I'll get the time to do this :(

Any other thoughts or ideas?
