---
layout: post
title: Caching a Page; Saving a Server
author: Jeff Geerling
nid: 158
comments: true
redirect_from: /blog/geerlingguy/caching-page-saving-server/
created: 1248468236
---
<p>
	A couple months ago, the Archdiocese of Saint Louis <a href="http://www.archstl.org/index.php?option=com_content&amp;task=view&amp;id=858&amp;Itemid=1">announced</a> that a new Archbishop had been chosen (then-Archbishop-elect Robert J. Carlson). For the announcement, the Archdiocese streamed the press conference online, then posted <a href="http://stlouisreview.com/article/2009-04-21/photos-bishop-carlson-during-his-first-day-st-loui">pictures on the St. Louis Review website</a> of the day&#39;s events (updated every hour or two).</p>
<p class="rtecenter" style="width: 550px; margin: 0 auto;">
	<img alt="Pageviews on April 21, 2009 - Archstl.org" height="180" src="/sites/opensourcecatholic.com/files/user-uploads/oscatholic/pageviews-graph.png" width="534" /><br />
	<span style="font-size: .7em; line-height: 1.1em">Pageviews for April 21, 2009 on archstl.org &ndash; note that from 8-10 a.m., the server was practically down from the thousands of hits/requests it was getting. Just before 10 a.m., I enabled the caching described below. We announced everything via Twitter, SMS, Press Releases, and the web, just after 5 a.m.</span></p>
<p>
	During this period of time, the Archdiocesan website had over 2,000 visitors per hour, and almost all the visitors were hitting the home page. The website (run on Joomla 1.0.x) didn&#39;t have many caching mechanisms in place, and for almost a complete hour, the website was returning server errors as the processor was pegged at 100% utilization. Something had to be done!</p>
<!--break-->
<h3>
	Quick-Fix Mode</h3>
<p>
	Quickly, I opened up the .htaccess file and denied all traffic except from the Archdiocesan offices (so I could access the site to make a fix!). Then I saved the home page as an .html file using FireFox (just the source), and uploaded it to the server. I finally put the rule <code>DirectoryIndex index.html index.php</code> into the .htaccess file so visitors going to www.archstl.org would be served the html file (which the server can send out <em>much</em> quicker and easier than any kind of PHP page, which requires time and memory for the server to build).</p>
<p>
	I then took out the deny rule, and the server was pretty happy for the rest of the day (although still hovering around 50% processor usage, due to the number of page requests). The <a href="http://stlouisreview.com/">St. Louis Review site</a>, running on its own dedicated server through SoftLayer, and running with abundant page caching and file aggregation (through Drupal&#39;s built-in means), received about half as much traffic but ran a lot faster due to (a) a brand-new, very efficient server, and (b) lots of caching.</p>
<h3>
	A Better Fix (for Now) - Home Page .html Caching</h3>
<p>
	With the pressure of the Archbishop announcement past, I knew there would be another day where traffic would reach some pretty lofty heights: the day of the <a href="http://www.archstl.org/index.php?option=com_content&amp;task=view&amp;id=899&amp;Itemid=1">Installation Mass</a>. We heavily promoted the Mass through all means possible, and advertised that it would be streamed live on our site (with up-to-the-minute pictures on the St. Louis Review site).</p>
<p>
	Since I didn&#39;t have time to fix all the bugs causing page caching to be more efficient on the Joomla site (www.archstl.org), I instead went the route of having a PHP script automatically update the site&#39;s home page as an html file every 5 minutes. The home page gets somewhere around 5-10,000 views every day, so this fix would help in the long run as well.</p>
<p>
	I found a great script online (can&#39;t find the link anymore) which I adapted (with the help of a few Twitter friends) to our site&#39;s peculiarities, and then set up a cron job on the server to run the script every five minutes. The script basically grabs the front page using PHP&#39;s file_get_contents() function, then saves it to the location you specify.</p>
<p>
	In addition to this, I made sure to redirect visitors to the cached .html file. For the home page, I just set the DirectoryIndex directive properly; for other pages (or for a script that will cache any page, anywhere), you&#39;ll need to write some fancy redirect rules for Apache to handle.</p>
<p>
	Here&#39;s the script:</p>
<pre><?php

// Uncomment below to turn on error reporting as needed.

/*
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
*/

/**
 * Script is meant for caching a page on www.archstl.org in order to
 * make the homepage load much, much faster than it would if it had to
 * keep querying the database on each page load.
 *
 * The configuration.php file is included in this same directory because
 * Joomla's index.php file requires it to be in the same directory as
 * the script that's calling on index.php.
 *
 **/

// Define the home page of the site.

$homePage = "/home/archstl/public_html/index.html";

// Delete the existing index.html file.

unlink($homePage);

// Get the file $filename, run the script, then save it to $contents

function get_include_contents($filename) {
   if (is_file($filename)) {
	  
       ob_start();
	   
       include $filename;
       $contents = ob_get_contents();
       ob_end_clean();
       return $contents;
   }
   echo "no file"."<br />";
   return false;
}

// $string is the path to the file you want to cache.

$string = file_get_contents("http://www.archstl.org/");

// Add a line showing when the page was last cached

$string .= "\r<!-- Page cached by the supercache on " . date('m/d/Y H:i:s') . " -->";

// Write the file to the cached .html file

$handle = fopen("/home/archstl/public_html/index.html", "w");

if (fwrite($handle, $string) === FALSE) {
       echo "Cannot write to file.";
       exit;
   }

echo "Success, wrote content to file!";

fclose($handle);

// Allow anyone (web visitors) to read the file

chmod("/home/archstl/public_html/index.html", 0755);

?>
</pre>
<p>
	The site handled the Installation Mass day pretty well, never peaking above 50% CPU, even with both archstl.org and stlouisreview.com both hosted on the same server (unlike the day of the announcement):</p>
<p class="rtecenter">
	<img alt="Pageviews Graph for June 10 - Day of the Archbishop's Installation Mass" height="267" src="/sites/opensourcecatholic.com/files/user-uploads/oscatholic/pageviews-installation.png" width="568" /></p>
<h3>
	Long-Term Solution</h3>
<p>
	The above script is helping the site run pretty efficiently right now (average CPU utilization for archstl.org went down from 14-15% a day to 7-9% a day), but it would take a lot of work to get it integrated into our current Joomla system (especially since every section of the website is its own Joomla install, and would require some unique additions).</p>
<p>
	I&#39;m a huge fan of the Drupal <a href="http://drupal.org/project/boost">Boost</a> module, as it has performed flawlessly on the St. Louis Review drupal-based site, serving up thousands of pages a day and keeping the processor utilization and memory footprint quite tidy (<a href="http://www.midwesternmac.com/blogs/geerlingguy/using-boost-drupal-making-mcwebsite">case study here</a>), and I know there&#39;s a similar solution for WordPress (<a href="http://ocaoimh.ie/wp-super-cache/">WP Super Cache</a>), which allows html caching of everything for anonymous users. Plus, Drupal&#39;s built-in caching engines and CSS/JS aggregation options are quite amazing. The question in my mind is, where is this secret sauce for Joomla? I haven&#39;t found much in the way of high-performance options for Joomla sites, but I&#39;m keeping my eyes open.</p>
