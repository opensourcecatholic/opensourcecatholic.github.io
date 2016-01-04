---
layout: post
title: 'Drupal Views Filters: Making Exposed Searches User-Friendly'
author: archstl
nid: 207
created: 1265233730
---
<p>
	One of the main new features of the Archdiocese of Saint Louis&#39; website (to launch on February 22!) is the much-improved parish and school&nbsp;searching capabilities. There are many facets to these sections of the site; everything is built using the combination of nodes built with <a href="http://drupal.org/project/cck">CCK</a>, <a href="http://drupal.org/project/views">Views</a>, and <a href="http://drupal.org/project/mapstraction">Mapstraction</a> (for Google Map interfaces).</p>
<p class="rtecenter">
	<img alt="Parish Search by Name" class="imagecache-300px-by-300px" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/imagecache/300px-by-300px/user-uploads/oscatholic/parish-search_0.png" title="" /></p>
<p>
	One of the main annoyances with most implementations of parish and school searching that I&#39;ve found (and I&#39;ve tested almost every U.S. Archdiocese&#39;s website for this functionality) is the fact that searches are extremely rigid - if you don&#39;t type in the exact terms for the title of the parish in the parish database, you won&#39;t get any results.</p>
<p>
	For instance, type in &quot;St. Luke,&quot; and you might get a result for St. Luke parish. However, type in &quot;Saint Luke,&quot; and you get nothing. Or, what if you type in &quot;Saints Joachim and Anne,&quot; but the parish is in the database as &quot;Sts. Joachim &amp; Anne&quot;?</p>
<!--break-->
<p>
	To message search data, we used a few regex filters on the user input, and Drupal allowed us to do this pretty easily by hooking into the exposed form on the parish and school search pages.</p>
<h3>
	Hooking into Views&#39; Exposed Forms</h3>
<p>
	First, you&#39;ll have to <a href="http://drupal.org/node/206753">create a custom module</a> for your Drupal site. Inside that custom module, you&#39;ll use a hook_form_alter() to alter the user input of the views exposed form just before it&#39;s submitted to the search. Here&#39;s our form_alter():</p>
<p>
<?php
/**
 * Implementation of hook_form_alter().
 */
function custom_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'views_exposed_form') {
    // Add custom validation form for parish search
    if ($form['#parameters']['1']['view']->name == 'parish_directory') {
      $form['#validate'][] = 'custom_parish_form_switcheroo';
    }
  }
}
?></p>
<p>
	We are using a &quot;parish_directory&quot; view, so we tell hook_form_alter to only apply our custom function, &#39;custom_parish_form_switcheroo,&#39; to the parish name search form.</p>
<p>
	And here&#39;s our custom function, which takes the form data as entered by the user, applies some regular expression replacements (using PHP&#39;s preg_replace()), and then sends that data to the search filter:</p>
<p>
<?php
/**
 * Makes parish search easier.
 */
function custom_parish_form_switcheroo($form, &$form_state) {
  // Convert abbreviations (like "St.", "Sts.", "St", "St")
  // Also, sometimes there is a "/" right before the "St." part, so strip that
  $form_state['values']['name'] = preg_replace('/^(\/)?st(s)?(\.)? /i', '$1Saint$2 ', $form_state['values']['name']);
  // Change ampersand to "and" ("Joachim & Ann" becomes "Joachim and Ann")
  $form_state['values']['name'] = preg_replace('/&/i', 'and', $form_state['values']['name']);
  // Strip "'s" (eg, "St. Sabina's" turns into "St. Sabina")
  $form_state['values']['name'] = preg_replace("/'s$/i", '', $form_state['values']['name']);
}
?></p>
<p>
	Using these rules, we are able to allow people to search for &quot;St., &quot;Saint,&quot; &quot;Sts.,&quot; &quot;Saints,&quot; &quot;St,&quot; etc... they can also type in &quot;Saint Sabina&#39;s,&quot; and get the proper result. basically, we&#39;re allowing users to not have to worry as much about data purity.</p>
<p>
	In an ideal world, Views would provide a built-in &#39;<a href="http://googledna.blogspot.com/2006_06_01_googledna_archive.html">did you mean</a>&#39; filter, but until then, we&#39;ll have to improve user experience in Views searching using baby steps...</p>
<p>
	<em>I would like to thank <a href="/users/joel-stein">Joel Stein</a> for his excellent help in setting up this feature on the Archdiocesan website!</em></p>
