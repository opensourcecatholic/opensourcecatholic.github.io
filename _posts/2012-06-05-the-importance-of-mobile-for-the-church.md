---
layout: post
title: The Importance of Mobile for the Church
author: Jeff Geerling
nid: 421
created: 1338906546
---
<img src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/Jeff%20Geerling/vatican-website-iphone.png" alt="Vatican Website on the iPhone" width="253" height="475" style="float: right; margin: 10px;" />By 2015 (probably sooner), more people in the world will be accessing Church websites with mobile devices than traditional desktop computers (<a href="http://www.lukew.com/ff/entry.asp?1510">source</a>).

Most Catholic websites (including this one, currently) are designed only for traditional desktop computer displays, and look either atrocious or (at best) hard to read on mobile devices.

<strong>This is a major problem.</strong>

It's not good enough to simply be present on the web anymore; the Catholic Church—once a leader in the arts, science and technology research, etc.—has fallen far behind on the Internet. The <a href="http://www.vatican.va/">Vatican's website</a>, once one of the only public websites on the Internet, is now a relic of the past, being difficult to navigate and read not only on mobile devices, but even on desktop computers.

Most diocese-level websites have a design aesthetic straight from the late 90s, and parish-level websites are beyond that. Many in the Church say "the 90s isn't that long ago...", but they don't realize that for the new generation of youth who are now maturing into adulthood, an ugly and hard-to-use website is the equivalent of locking the doors to your church during daytime hours so they can't come in and pray (which, sadly, many Catholic parishes <em>also</em> do).

Many parishes don't even have a website, much less a website that's designed to be easy to use for mobile users. Even if a parish just had a page that listed the parish name, had a picture of the parish, a map link, a phone number, and Mass Times (and <em>nothing more</em>), it'd be better than about half the parish websites that exist today. And it would probably work better on mobile browsers.

An article posted recently to CatholicTechTalk.com asks, <a href="http://catholictechtalk.com/2012/06/05/is-your-church-website-mobile-enabled-2/">is your church website mobile-enabled?</a> I would ask, more pointedly, is your church website designed for mobile users? (I would even say that it would be better to design only for mobile users than only for traditional desktop users, at this point).

<h3>What to Avoid</h3>

To make sure your website is at least at a base level of mobile-friendliness, here are some things you should try to avoid—especially on your site's home page:

<ol>
	<li><strong>Complexity.</strong>
Complexity kills performance, confuses users, and even makes it harder for you to manage your own site. Don't include something in navigation unless it's really important, and cut down on the features/add-ons you add to your site (especially on the front page).</li>
	<li><strong>Adobe Flash. For anything. Get rid of it.</strong>
Most devices won't show it at all, and those few that do, render Flash poorly and/or slowly. (Same goes for Silverlight, Java, or other plugin-based content).</li>
	<li><strong>Large image backgrounds and other large images.</strong>
Mobile devices are often used over 3G connections, and even newer 4G connections are nowhere near as fast or reliable as home broadband. Don't make mobile users wait for a minute to load your website—they won't wait, they'll just close the window and leave.</li>
	<li><strong>Things that require mouse-based interaction.</strong>
Really detailed image maps should not be used, as they're difficult for a touch-based user to touch. Also, some forms of menus (like mega menus) should be well-tested on touchscreen devices before they're deployed.</li>
	<li><strong>Script-heavy pages.</strong>
If you have a lot of JavaScript logic (or jQuery/whatever library you use), mobile devices often spend 5-10x longer than desktops processing the logic. Keep that in mind when you decide to use 35 different JS effects on a page!&nbsp;</li>
</ol>

<h3>What to Foster</h3>

<ul>
	<li><strong>Simplicity.</strong>
One of the greatest challenges of my job redesigning the Archdiocese of St. Louis' website was reducing the clutter on the front page; cutting down links, showing only a few items, etc. Sometimes it's hard to cut clutter, but think of exactly what site visitors want, and focus only on that. As a side effect, your website will load faster and be easier to read.</li>
	<li><strong>Responsive and/or mobile-first design.</strong>
It's not too hard to turn a simple design into a responsive design, which looks good on a variety of devices (think iPhone, iPad, Kindle Fire, Laptop, Desktop, TV, etc.). Here's a quick guide I wrote <a href="http://www.midwesternmac.com/blogs/jeff-geerling/making-your-current-drupal">for Drupal themes</a>. A good book to get you started is here: <a href="http://www.amazon.com/gp/product/B005SYWGXW/ref=as_li_ss_tl?ie=UTF8&amp;tag=httpwwwmidw06-20&amp;linkCode=as2&amp;camp=1789&amp;creative=390957&amp;creativeASIN=B005SYWGXW">Responsive Web Design</a>. Check out an <a href="http://www.lifeisaprayer.com/blog/2012/life-a-prayer-looking-great">example of responsive design</a> (resize your browser window or view it on a mobile phone).</li>
	<li><strong>Fewer resources.</strong>
If possible, try combining small JavaScript files or multiple CSS files into one. Use preprocessors and minification tools (like <a href="http://marijnhaverbeke.nl/uglifyjs">UglifyJS</a>) to make resources much smaller in size. It takes mobile devices much longer to download resources (especially when there are many) than desktop computers.</li>
	<li><strong>Front-end performance.</strong>
A lot of people spend hours worrying about optimizing MySQL to gain 100ms on the server processing a page, or optimizing a PHP function to save 10ms. Did you know that most of the time spent rendering a page these days actually takes place on the user's device (especially with mobile devices, which are many times slower than the fastest desktops on which you're developing your website!). Read this article for more info: <a href="http://drupalwatchdog.com/1/2/big-performance-wins-on-front-end">Big Performance Wins on the Front End</a>.</li>
</ul>

<h3>Not There Yet</h3>

I'm giving these bits of advice to fellow Catholic web developers; unfortunately, most that I know are overworked, don't get paid enough by Catholic institutions to justify spending time helping make a site mobile-friendly, or can't spend their free time trying to help often stubborn Catholic institutions to join the 21st century web.

Sadly, then, most of these words are going to fall on deaf ears. But the Church and Catholic organizations need to seriously consider whether they want to court an entire generation of web users who will have only a mobile phone and maybe something like an iPad, or ignore them and focus only on a bygone time of the web. Bulletins, mailings, and phone calls aren't cutting it today, and they won't cut it in the future.

Personal contact—one of the things at which the Church is a pro—isn't a given these days, and the Church needs to court people in any avenue possible, especially online. Let's clean out our welcome mats (our websites), and make our entrances more inviting. Welcome people through technology, and then make a personal connection.
