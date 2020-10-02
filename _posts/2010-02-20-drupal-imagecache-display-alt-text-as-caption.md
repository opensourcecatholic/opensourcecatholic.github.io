---
layout: post
title: Drupal ImageCache - Display Alt Text as Caption
author: geerlingguy
nid: 212
comments: true
redirect_from: /blog/oscatholic/drupal-imagecache-displa/
created: 1266698607
---
<p>
	While building the Archdiocese of Saint Louis&#39; website (launching Feb. 22, 2010), I needed an easy and quick way to <strong>allow users to caption images, without much hassle</strong>. On the old Joomla version of the website, users would have to upload an image, then insert it, then click on it, then click another button to add an image caption, set border properties, add padding, etc.</p>
<p>
	To cut through most of that mess, I set up an <a href="http://drupal.org/project/imagefield">ImageField</a> with Drupal&#39;s <a href="http://drupal.org/project/insert">Insert</a> module, which helps save a few clicks (and eliminates any need for users to navigate through directories and manage yet another set of files on the server itself&mdash;this approach is not altogether bad, but can be harder to teach to many people). But how to do image captions?</p>
<p>
	Easy! Just create an <a href="http://drupal.org/project/imagecache">ImageCache</a> preset that can be used by the Insert module when an image is inserted, and use a theme function (inside your Drupal theme&#39;s <strong>template.php</strong> file) to grab the Alternate text and convert it to a caption.</p>
<p>
<?php
/**
 * Add a caption to imagefield pictures with an 'alt' tag
 */
function archstl_imagecache($namespace, $path, $alt = '', $title = '', $attributes = NULL) {
  if ($path) {
		$attributes = drupal_attributes($attributes);
	  $imagecache_path = file_create_url(file_directory_path() .'/imagecache/'. $namespace .'/'. $path);
	  $output = '<img src="'. $imagecache_path .'" alt="'. check_plain($alt) .'" title="'. check_plain($title) .'" '. $attributes .' />';
	  $output .= '<div class="caption">'. check_plain($alt) .'</div>';
	  return $output;
	}
}
?></p>
<p>
	One downside to this approach is the fact that users won&#39;t be able to see the caption while they&#39;re editing the page... but I might figure out something to fix that, perhaps with a JavaScript plugin for the TinyMCE editor (we use the WYSIWYG module to set up editor profiles on the new site).</p>
<p>
	[UPDATE: This is not quite working for me right now... works great for imagecache-built CCK ImageFields, but not with inserted images... might have to resort to a JavaScript-only solution for the time being.]</p>
<p>
	The new Archdiocesan website will launch on Monday, February 22... stay tuned!</p>
