---
layout: post
title: Archdiocese of Saint Louis' Upgraded Website
author: geerlingguy
nid: 198
comments: true
redirect_from: /blog/oscatholic/archdiocese-saint-louis-upgraded-website/
created: 1266840001
---
<p>
	In early 2009, it was determined that the Archdiocese of Saint Louis needed to upgrade its website, mostly for security concerns. After investigating a move from Joomla 1.0.x to Joomla 1.5.x, the Archdiocese determined it would be more cost effective and a more future proof decision to migrate the over 49 individual Joomla sites that comprised www.archstl.org into a single Drupal installation.</p>
<p class="rtecenter">
	<img alt="Archdiocese of Saint Louis Website Upgrades" height="242" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/archstl-upgrade-screens.jpg" title="" width="650" /></p>
<p>
	This upgrade/migration provides many benefits, not the least of which are a better end-user experience, a better administrative experience, and much improved page load and search indexing performance. In addition, Drupal&#39;s structure and content presentation provide much greater flexibility in design and information structure, as well as SEO (search engine optimization) than other popular CMS frameworks that were investigated.</p>
<p>
	The decision was made early on to partner with a development company that would help with the content migration and initial site buildout. Theming would be done in-house. We chose to partner with <a href="http://www.palantir.net/">Palantir.net</a>, a web development company located in Chicago, IL. After Palantir completed initial site work, I went up to meet them, and also attended my first <a href="http://www.drupalcampchicago.org/">DrupalCamp (Chicago)</a>; Chicago has a much more vibrant Drupal community than St. Louis... but perhaps that will change at some point!</p>
<p>
	After nearly a year&#39;s worth of planning and development, the Archdiocese launched its upgraded website on February 22, 2010.</p>
<!--break-->
<h3>
	Server Configuration</h3>
<p>
	The Archdiocesan website was formerly running on a server managed through RackSpace, but costs and configuration restraints prevented us from continuing on a managed server through RackSpace. We migrated all of the Joomla sites to a new dedicated server from <a href="http://softlayer.com/">SoftLayer</a>, and also migrated a few of our other sites (including the <a href="http://stlouisreview.com/">Saint Louis Review</a> - <a href="http://drupal.org/node/429448">case study on Drupal.org here</a>). Due to caching and optimizations, the server is typically not burdened much, even with a few relatively high-traffic sites running on it.</p>
<p>
	The server is running the CentOS distribution of Linux, along with Apache, PHP and MySQL. Apache&#39;s configuration is set to survive a slashdotting, PHP is configured with APC caching for performance, and the MySQL configuration has been thoroughly tweaked to provide the best performance with the amount of RAM we have in the server.</p>
<h3>
	Modules Used</h3>
<p>
	Like any large website, this Drupal installation used a plethora of modules to enable certain functions and features. Here are some of the more relevant/prominent modules we used:</p>
<ul>
	<li>
		<a href="http://drupal.org/project/joomla">Joomla to Drupal</a>: This module saved quite a bit of time and frustration when we were transferring all the content from the 40+ Joomla websites that made up the old archstl.org, and allowed us to easily add content from live site. The module was highly customized by Palantir to help import content directly into Organic Groups. (<a href="http://drupal.org/user/20975">agentrickard</a> did the lion&#39;s share of the work in moving all the databases - he should at least get a cookie for all that work!)</li>
	<li>
		<a href="http://drupal.org/project/tw">Table Wizard</a> + <a href="http://drupal.org/project/migrate">Migrate</a>: Palantir helped immensely with regard to a ton of legacy data we use on our website to populate the Parish, Schools, and Organizations directories. Using Table Wizard and Migrate, plus a custom shell script (which runs every morning), we pull in data from various csv files, import them into Views-accessible tables, and then use Migrate to build a node for each organizational entity. (Special thanks to <a href="http://drupal.org/user/20975">agentrickard</a> and <a href="http://drupal.org/user/146719">sdboyer</a> for setting this up).</li>
	<li>
		<a href="http://drupal.org/project/custom_formatters">Custom Formatters</a>: Key to formatting a ton of content pulled from an Archdiocesan database. We used this module to set up formatters for phone numbers, Mass Times, and other miscellaneous data pulled into CCK fields.</li>
	<li>
		<a href="http://drupal.org/project/views">Views</a> + <a href="http://drupal.org/project/cck">CCK</a>: These two modules were used to build out almost the entire website. All content types use a &#39;body&#39; field provided by CCK (in Drupal 7, this is how nodes are built - there is no more &#39;Body&#39; attached to a node). The <a href="http://archstl.org/prayer/request-a-prayer">Request a Prayer</a> and <a href="http://archstl.org/commoffice/bulletin-gateway">Bulletin Gateway</a> system are both built on Views and CCK.</li>
	<li>
		<a href="http://drupal.org/project/mapstraction">Mapstraction</a>: This module allowed for gratuitous use of Google Maps on nodes (using the Views attach module and node content displays), and in views (using a Mapstraction view attachment). (<a href="http://drupal.org/user/20975">agentrickard</a> gets another cookie for this).</li>
	<li>
		<a href="http://drupal.org/project/date">Date</a> + <a href="http://drupal.org/project/calendar">Calendar</a>: The Calendar provides a very pleasing-to-the-eye listing of all the events posted to the website, and users can easily filter by group or event type using a Views exposed filter. The Date module supplies time/date functions for Event nodes and other features.</li>
	<li>
		<a href="http://drupal.org/project/og">Organic Groups</a>: Each office and agency is set up as an organic group, with permissions for posting new news/blog posts, pages, forms (using <a href="http://drupal.org/project/webform">Webform</a>), and events. Additionally, each group gets its own menu, provided through the <a href="http://drupal.org/project/og_menu">OG Menu</a> module.</li>
	<li>
		<a href="http://drupal.org/project/apachesolr">ApacheSolr</a>: After having many troubles with the large database (over 20,000 nodes, with about 800 words per node on average) with search indexing and cron runs, I decided to install ApacheSolr and the Lucene search server, then set up cron using the <a href="http://drupal.org/project/elysia_cron">Elysia Cron</a> module (to help ensure cron was running efficiently).</li>
	<li>
		<a href="http://drupal.org/project/ubercart">&Uuml;bercart</a>: Online giving pages and the shopping cart system (with PayPal integration) are provided by &Uuml;bercart, along with a healthy dose of hook_form_alter()s and <a href="http://drupal.org/project/rules">Rules</a>. (<a href="http://drupal.org/user/32095">johnalbin</a> setup most of our donation system, and <a href="http://drupal.org/user/36598">joelstein</a> helped with a lot of cleanup issues, including notification emails, some rules actions, etc.).</li>
</ul>
<h3>
	SVN Version Control</h3>
<p>
	Working together with Palantir.net, I was finally forced to jump in headfirst into using a version control system. We decided to use SVN, and after I set it up on our Archdiocesan web server (running CentOS), we synchronized repositories with Palantir, then worked together (I did most of the theming, while Palantir did most of the back-end development and content migration), checking in and out quite frequently.</p>
<p>
	I tried to use Coda&#39;s built in SVN functionality, but ultimately had so many problems (it&#39;s in its early stages) that I decided to stick to using the Terminal to interact with the repository.</p>
<h3>
	Theming</h3>
<p class="rtecenter">
	<img alt="Archdiocese of Saint Louis Theme" height="412" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/Archdiocese-of-Saint-Louis.jpg" title="" width="500" /></p>
<p>
	Since I am very familiar with the internals of Zen 2.x (which was in an alpha release at the time I started site theming), I decided to build a Zen subtheme for this site. The archstl theme has a total of over 15 .tpl.php templates (I tried doing as much preprocessing as I could, but there are some structural XHTML changes that needed to be made directly in the templates), as well as 12 CSS files and a handful of javascript files.</p>
<p>
	The theme has a few main features:</p>
<h4>
	Mega Drop-Down Menu Navigation</h4>
<p class="rtecenter">
	<img alt="Mega Menus" height="299" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/mega-menus.png" title="" width="500" /></p>
<p>
	A trend that has become relatively popular of late, <a href="http://www.useit.com/alertbox/mega-dropdown-menus.html">mega drop-down menus</a> provide the main navigation for the site. These drop downs are basically divs inside of a list of five main-level navigation links. The divs appear after hovering over a main link, and disappear a short bit after the mouse stops hovering. This functionality is provided via JavaScript.</p>
<p>
	Using mega menus has even allowed us to insert a parish search form directly into one of the menus. As this is one of the most frequently used features on the site, it should help save a little time for many users.</p>
<p>
	Due to restrictions in Drupal&#39;s menu system, I decided early on to simply create a custom php file with all the navigation markup, and then include that (using a php include) in the site&#39;s page.tpl.php templates. At some point, I might move this menu system into some sort of module, for easier management, but our main navigation doesn&#39;t change all that much, so it should be safe as-is for now.</p>
<h4>
	CSS3 / Progressive Enhancement</h4>
<p>
	Depending on what browser you use to view the new site, you&#39;ll either see rounded corners all over the place, of straight corners on edges of navigation links, sidebar blocks, and content items. Also, blocks should have beautiful box-shadows applied in any Webkit-enabled browser (newer versions of FireFox should also show the shadows).</p>
<p>
	The site was thoroughly tested in Internet Explorer 6, 7 and 8, as well as FireFox 3+, Safari 4+, Opera 10, and Chrome 4+. Almost all of the main template is coded to meet CSS2 validation standards, and a glance at the <a href="http://validator.w3.org/check?uri=http%3A%2F%2Farchstl.org%2F&amp;charset=%28detect+automatically%29&amp;doctype=Inline&amp;group=0">W3C Validator</a> (for the XHTML markup) provides an almost error-free review (the main pages seem to work well, but some legacy content has a ton of invalid cruft).</p>
<h4>
	Better Text Layout / Spacing</h4>
<p>
	The old site didn&#39;t give much thought to line-height, heading formatting, and text styling. The new theme contains styles for everything from blockquotes to list styles and every level of heading. It is much more pleasant to read a long page or article on the upgrade site.</p>
<p>
	Check out the <a href="http://archstl.org/commoffice/page/typography-test-page">Typography Test Page</a> (a great way to quickly make sure you&#39;ve styled the main elements).</p>
<h3>
	Other Features</h3>
<h4>
	Parish and School Search</h4>
<p class="rtecenter">
	<img alt="Parish Search Pages" height="279" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/parish-search.png" title="" width="475" /></p>
<p>
	The <a href="http://archstl.org/parishes">parish search pages</a> (along with <a href="http://archstl.org/schools">school search pages</a>) are set up using Views and the excellent <a href="http://drupal.org/project/mapstraction">Mapstraction</a> module (which allows us to use a view attachment to link a map to all the nodes listed in a view). (Read more about our <a href="/blog/archstl/drupal-views-filters-mak">custom views exposed filter handler</a>).</p>
<p>
	We set up a custom view with some exposed filters to sort <a href="http://archstl.org/commoffice/press-releases">Press Releases</a> and give an RSS feed for those who wish to follow the Archdiocesan news releases.</p>
<h4>
	Prayer Requests</h4>
<p>
	The Archdiocese of Saint Louis is privileged to have a wide variety of religious communities, and one of the beautiful things many of these communities have done is pray for thousands of online prayer requests since the beginning of the third millennium. Our online prayer request form has evolved from an email form, to Joomla&#39;s PrayerCenter, and finally to a fully-customized and highly-optimized feature on our new site. You can read more about&nbsp;<a href="/blog/oscatholic/free-alternative-prayerc">how we basically rebuilt PrayerCenter</a>, with tons of great improvements.</p>
<h4>
	Calendar System</h4>
<p class="rtecenter">
	<img alt="Calendar of Events" height="360" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/calendar-of-events.png" title="" width="400" /></p>
<p>
	The calendar system warrants a post on its own (I&#39;ll probably do that later), but using the power of CCK + Date + Calendar, you can make a calendar system that is infinitely extensible. Throw in Views and Organic Groups, and you have a magic combination.</p>
<p>
	On the old site, it was very hard to (a) manage calendar events (we used JCal Pro), and (b) integrate calendars into other content, and into each other. On the new site, since all events are simple event nodes with metadata attached, we can aggregate the nodes in so many different ways (besides the simple universal <a href="http://archstl.org/calendar">Calendar of Events</a>) to build a ton of different listings of calendar events&mdash;lists by taxonomy terms, month, year and day views, simple lists, and sortable and searchable event lists.</p>
<p>
	Another nice feature of the Calendar module is the ease of creating iCal-compatible calendar feeds. You can simply click the icon, and subscribe to the Archdiocesan calendars.</p>
<h3>
	Conclusion</h3>
<p>
	After almost a year of development, it is a wonderful feeling having a project like this out the door. There remain a lot of small tweaks, especially to content manager interaction, but things are much easier now that everything is unified into one codebase and database.</p>
<p>
	Moving forward, there are a ton of useful new features under development, and many of the current features will be further streamlined based on user feedback. I&#39;ll be posting more as the time comes!</p>
<p>
	What do you think of the site? Follow the <a href="http://twitter.com/archstl">Archdiocese of Saint Louis on Twitter</a>, or visit the <a href="http://www.facebook.com/archstl">Archdiocese of St. Louis Facebook Page</a> to provide feedback!</p>
