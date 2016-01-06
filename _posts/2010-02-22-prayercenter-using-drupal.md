---
layout: post
title: PrayerCenter (using Drupal)
author: Jeff Geerling
nid: 204
comments: true
redirect_from: /blog/oscatholic/free-alternative-prayerc/
created: 1266840000
---
<p>
	The Archdiocese of Saint Louis&#39; website has always had a very widely-used and useful prayer request functionality. Anyone in the world can submit a prayer request, and every prayer request is moderated and prayed for by contemplative sisters in the Archdiocese.</p>
<p class="rtecenter">
	<img alt="Old Prayer Center Form" class="imagecache-300px-by-300px" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/imagecache/300px-by-300px/user-uploads/oscatholic/old-prayer-request_1.png" title="" /><br />
	The old prayer request form</p>
<p>
	The website first had an online contact form, and all prayer requests were submitted by email. However, after some time, this got to be quite a burden (hundreds of requests were coming in every day!). The Archdiocese used a Joomla! component, <a href="http://extensions.joomla.org/extensions/miscellaneous/religion/1988">PrayerCenter</a>, to handle the prayer requests for some time, with some custom modifications to speed up the workflow of moderating hundreds (some days, many hundreds!) of prayer requests. PrayerCenter is pretty good, but is not as modular and able to be customized as I would like.</p>
<p class="rtecenter">
	<img alt="Create Prayer Request Form" class="imagecache-300px-by-300px" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/imagecache/300px-by-300px/user-uploads/oscatholic/create-prayer-request.png" title="" /><br />
	The new prayer request form</p>
<p>
	The new <a href="https://palantir.archstl.org/node/add/prayer-request">prayer request form</a> (visible to end users) is highly optimized, and much more user-friendly. It limits the amount of characters in a prayer request, and using jQuery, shows the user how many characters he has remaining. Going completely custom allowed us to also tweak every last detail to our liking, meaning we didn&#39;t have confusing PrayerCenter branding here and there.</p>
<!--break-->
<p>
	PrayerCenter was working okay for a while, but every few months, when the number of prayer requests would hit something like 50,000, the request form would lock up (Prayer Center was not built to handle this kind of volume), and the database would have to be reset.</p>
<p>
	When the Archdiocese decided to rebuild its website in 2009, I had to ensure this prayer request functionality was present (first of all), but I also wanted to improve its usability and optimize the moderation process.</p>
<h3>
	Drupal CCK, Content Types, and Views: Building Blocks</h3>
<p>
	To begin, I set up a &quot;Prayer Request&quot; content type, and set it to have the following fields:</p>
<ul>
	<li>
		<strong>First Name/Initials</strong> (this is the default &#39;Title&#39; field)</li>
	<li>
		<strong>Prayer Request</strong>: This CCK textarea field allows 750 characters, to make sure that prayer requests don&#39;t go on too long (our moderators don&#39;t have all day, you know!).</li>
	<li>
		<strong>&#39;Keep Private&#39;</strong> on/off checkbox</li>
</ul>
<p>
	By default, Prayer Requests are unpublished (this way nobody can see them except for the prayer request moderators.</p>
<p class="rtecenter">
	<img alt="Prayer Requests Page" class="imagecache-300px-by-300px" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/imagecache/300px-by-300px/user-uploads/oscatholic/prayer-requests.png" title="" /><br />
	The new prayer requests page</p>
<p>
	I then set up a view that does three things:</p>
<ol>
	<li>
		<em>Shows a public listing of &#39;approved&#39; (i.e. &quot;Published&quot;) prayer requests</em>. Anybody can view this page here: <a href="http://archstl.org/prayer/requests">Prayer Requests</a></li>
	<li>
		<em>Shows a listing of all the prayer requests marked Private</em>. A volunteer summarizes all these prayer requests and sends that summary to the contemplative sisters for prayer. After the volunteer reads all the requests (she will check a box next to each one as she reads them), she uses <a href="http://drupal.org/project/views_bulk_operations">Views Bulk Operations</a> (VBO) to mass-delete them.</li>
	<li>
		<em>Shows a listing of all the submitted prayer requests that are unpublished</em> (ready for moderation). The moderator can click &#39;Publish&#39; next to the prayer request, or click in the body of the prayer request to edit it (using AJAX - I used the <a href="http://drupal.org/project/editablefields">Editable Fields</a> and the <a href="http://drupal.org/project/publishcontent">Publish Content</a> modules to enable this functionality).</li>
</ol>
<p class="rtecenter">
	<img alt="Prayer Requests - Moderation" class="imagecache-300px-by-300px" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/imagecache/300px-by-300px/user-uploads/oscatholic/prayer-request-moderation.png" title="" /><br />
	The Moderation Page</p>
<p class="rtecenter">
	<img alt="Private Prayer Requests" class="imagecache-300px-by-300px" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/imagecache/300px-by-300px/user-uploads/oscatholic/private-prayer-moderation.png" title="" /><br />
	The Private Prayer Requests page</p>
<p>
	After setting up the views, I simply put everything into a &#39;Request a Prayer&#39; menu, then put that menu&#39;s block on all the various prayer request-related pages.</p>
<h3>
	RSS Feed of Prayers</h3>
<p>
	Using Drupal&#39;s <a href="http://drupal.org/project/views">Views</a>, it&#39;s pretty easy to create RSS/news feeds for whatever you want. We created a feed to go along with the Prayer Requests page, which shows <a href="http://archstl.org/prayer/requests/rss.xml">the last 40 prayer requests</a> posted to the website.</p>
<p>
	Using two of Drupal&#39;s most used modules (Views and <a href="http://drupal.org/project/cck">CCK</a>, which is now built into Drupal 7), we&#39;ve replicated pretty much the entire core of the PrayerCenter module for Joomla... except this system can handle trillions of prayer requests before we&#39;ll even have to think about the size of the database!</p>
