---
layout: post
title: 'Speeding up a Site: Quicker 404 Errors for files in Drupal'
author: oscatholic
nid: 256
created: 1272480697
---
<p>On the Archdiocese of Saint Louis website, we moved thousands of files around as part of our <a href="http://archstl.org/commoffice/page/evolution-archdiocesan-website">site migration</a> from 49 separate Joomla sites to Drupal. Internally, all our file links were updated. However, there are thousands of hotlinks from different websites to the Archdiocesan website (for instance, the blog American Papist hits a missing file of a Church interior about 80 times a day).</p>
<p>This was creating a lot of overhead for the server, as Drupal would do a full bootstrap, sending out a fully-rendered 404 page on each missing file request.</p>
<p>Looking to Drupal forums for help, I <a href="http://drupal.org/node/76824#comment-2834536">found some help from kbahey</a>, founder/owner of <a href="http://2bits.com/">2bits</a>, a Drupal shop that specializes in speeding up large Drupal sites. The advice in the issue linked above has the proper code for speeding up requests on a Drupal 7 site, but the code is slightly different for Drupal 6.x. Here&#39;s the code:</p>
<?php
/**
 * 404 Handling, to conserve server resources upon missing image/text/non-html file.
 */
if (preg_match("/\.(txt|png|gif|jpe?g|shtml?|css|js|ico|swf|flv|cgi|bat|pl|dll|exe|asp)$/", $_SERVER['QUERY_STRING'])) {
 header('HTTP/1.0 404 Not Found');
 print '<html><head><title>404 Not Found</title></head><body><h1>404 Not Found</h1><p>The requested URL was not found on this server. If you think you reached this page in error, please visit the <a href="http://archstl.org/">Archdiocese of Saint Louis home page</a> and search for the page or file for which you are looking.</p></body></html>';
 exit();
}
?><p>You can simply paste this at the bottom of the settings.php file.</p>
<p>In a nutshell, it does the following: If the request is for a file in it&#39;s list of regular expressions, and the file is not found, it will output 404 headers, along with a simple HTML string.</p>
<p>This is a heck of a lot faster than allowing a full Drupal bootstrap on each missing file request&mdash;an operation which, on our server, takes up a nice 30 MB of RAM, plus a lot extra CPU usage per request, when compared with using the code above.</p>
