---
layout: post
title: The Story of LOLSaints
author: Jeff Geerling
nid: 162
created: 1246133251
---
<p class="rtecenter">
	<a href="http://www.lolsaints.com/"><img alt="LOLSaints Header Image" height="107" src="/sites/opensourcecatholic.com/files/user-uploads/oscatholic/lolsaints-header-image.jpg" width="550" /></a></p>
<p>
	We all know the story about <a href="http://twitter.com/CurtJester/status/1143171133">@CurtJester&#39;s famous tweet</a> (read more on <a href="http://www.lolsaints.com/about">LOLSaints&#39; About page</a>). But how was the website set up? What kind of work went into it&#39;s creation, and how can you do the same if you need a similar kind of community-oriented blog?</p>
<p>
	After seeing the Curt Jester&#39;s tweet, I immediately began thinking about what I wanted to have happen on LOLSaints; I had to decide what specific kind of content to use, how often the site would be updated, and how much involvement registered users could have.</p>
<!--break-->
<h3>
	Initial Thought Process</h3>
<p>
	I decided immediately to use these basic guidelines:</p>
<ol>
	<li>
		Content would primarily be made by the users; I would try to act mostly as a moderator.</li>
	<li>
		Postings would be scheduled daily, so as to (a) save time for me, and (b) keep the site &#39;fresh.&#39;<br />
		(Freshness, bye the way, can help with a site&#39;s ranking on Google and other search engines).</li>
	<li>
		I would create a method of making the site manageable (at least to a certain extent) by the users themselves; especially in terms of deleting inappropriate comments, editing submissions, etc.</li>
</ol>
<p>
	Knowing that I wanted to have the option to easily add more features, multi-user management solutions, and possibly some other interesting developments, I decided to stick with <a href="http://drupal.org/">Drupal</a>, a CMS that is well-suited to these needs.</p>
<h3>
	Site Development</h3>
<p>
	I loaded a new installation of Drupal on my web hosting space, set up a database for it, then downloaded a theme (<a href="http://drupal.org/project/sandtiger">Sand Tiger</a>) from Drupal&#39;s free theme repository, and downloaded some modules I&#39;d need (most notably <a href="http://drupal.org/project/archive">Archive</a>, <a href="http://drupal.org/project/views">Views</a> and <a href="http://drupal.org/project/cck">CCK</a>) from Drupal&#39;s free module repository. (It&#39;s worth mentioning here that the Drupal project, along with pretty much all of it&#39;s modules and themes (with a rare exception), is licensed under the <a href="http://www.gnu.org/licenses/gpl.html">GPL</a>, meaning that it&#39;s all free and open for anyone to use and modify).</p>
<p>
	I used one &#39;content type&#39; (Story) to post each day&#39;s saint, and turned on voting (using the &#39;<a href="http://drupal.org/project/fivestar">Fivestar</a>&#39; module) and comments for each posting. Then I went to town, finding tons of pictures of funny Catholic imagery, Church artwork, and saints. I tried my best to make funny captions (some were pretty good, others were head-scratchers), then I decided to go live with the site and start promoting it everywhere... (more detail about that to follow).</p>
<p>
	After a few weeks, I worked on the site a little more, because I realized that there were a few things that make my life a lot harder that didn&#39;t need to be that way. Instead of having someone submit a saint image using a new kind of content type as an attachment, I changed the &#39;Story&#39; content type to allow anyone to post it, but it would remain unpublished until I or another moderator reviewed it. And instead of using file attachments for pictures, I used the <a href="http://drupal.org/project/imagefield">ImageField</a> module to allow people to upload their pictures and have them automatically set up to go on the website.</p>
<p>
	I only have a few moderators right now, but I hope a couple more people might be willing to help in the future; to that end, I&#39;m thinking of setting up a &#39;hall of fame&#39; kind of thing on the website to highlight the kindness and charity these moderators display. They are a godsend for me, since they help cut my workload for moderating things in half! I&#39;m always trying to refine the process of turning user-submitted content into something that is ready to go live on the site (and make it mesh well with the rest of the site, following the same styling and such), and any input to that effect is extremely helpful.</p>
<p>
	I&#39;m thinking of a few other new features for the future; having some t-shirts available for sale, having some sort of reward system for frequent contributors / moderators, and giving more prizes for things (besides respect ;-). As time goes on, I hope to write more about what I&#39;ve done and will do to the website to make it bigger, faster, and stronger.</p>
<h3>
	Marketing/Promotion</h3>
<p>
	Having set up many different websites, and being a pretty social guy, I tried to think of some ways to get LOLSaints some good exposure, especially in the Catholic blogosphere, in which I have a lot of good contacts. Obviously, the <a href="http://splendoroftruth.com/curtjester/">Curt Jester</a> was my first contact... the site idea came straight from him, and he and I had talked over a few of the general ideas for the site. After that, I put together an email list of some of my favorite Catholic bloggers, and prepared an email introducing myself (I don&#39;t know them all!) and the website.</p>
<p>
	I recieved some favorable replies from many of the bloggers, and on the launch day, I noticed maybe 15 or so stories about LOLSaints on their blogs. The traffic to the website was very good, and apparently even the <a href="http://www.osv.com/">OSV</a> (Our Sunday Visitor) and a few other Catholic publications found out about it! Over the next week or so, word was spreading through many of the different blogs, and I made sure to do a few blog searches and check my referral traffic to see where people were coming from. Using this information, I also tried to thank people when they posted about the blog, either in their comments or via email.</p>
<p>
	Also on launch day (and during the launch week), I spammed my <a href="http://twitter.com/geerlingguy">Twitter</a> and <a href="http://facebook.com/geerlingguy">Facebook</a> accounts with a few postings about the site (spam is a strong word... but I don&#39;t like it much when others self-promote, either ;-). This generated a bit of traffic, and to this day, I still get some visitors each day from <a href="http://www.facebook.com/pages/Vatican-City/LOLSaintscom-Saints-with-a-Smile/63001301552">LOLSaints&#39; Facebook Fan page</a>. Later on, I set up a <a href="http://twitter.com/LOLSaints">Twitter account for LOLSaints</a>, and although it doesn&#39;t have too many followers, it&#39;s another avenue by which I can try to keep the website in the fore.</p>
<h3>
	Summary</h3>
<p>
	To wrap this post up, it&#39;s important to be ready on all fronts when you&#39;re launching a website:</p>
<ul>
	<li>
		Have a good plan for what you want to do.</li>
	<li>
		Focus on one or two main topics for your site, unless you&#39;re trying to compete with Wikipedia.</li>
	<li>
		Have some sort of marketing strategy; if nobody knows about your site, why should they visit?</li>
	<li>
		Be willing to discuss things with others, and take their feedback into account in future decisions.</li>
</ul>
