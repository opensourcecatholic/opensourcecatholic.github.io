---
layout: post
title: Random Bugfixes for Internet Explorer 6/7
author: geerlingguy
nid: 157
comments: true
redirect_from: /blog/oscatholic/random-bugfixes-internet/
created: 1250873325
---
<p>For the better part of two days, I was working on making a new design (currently <a href="http://www.archstl.org/new/front/">here</a>) for the <a href="http://www.archstl.org/">Archstl.org</a> website display correctly in Internet Explorer. There were a few bugs that took me hours to solve, so I thought I'd share here my solutions (note: 'good browsers = all browsers but IE').</p>
<p class="rtecenter"><img alt="Archdiocese of Saint Louis final design screenshot" width="400" height="316" src="/sites/opensourcecatholic.com/files/user-uploads/oscatholic/archstl-new-design-final.jpg" /></p>
<p>Above:&nbsp;the final screenshot - I'll be working now mostly on little tweaks, and on porting this design to a CMS theme...</p>
<h3>The z-index property - fine in good browsers, bad in IE</h3>
<p>The first major problem I encountered was a bug in IE 6 and 7 - the 'mega menus' were appearing behind the jquery-enabled scrolling ads. I fuddled with z-index values quite a bit, and found a way to make the mega menus appear over the ads themselves, but the green arrow buttons were still appearing <em>on top of</em> the mega menus!</p>
<p>After a few hours of reading many different opinions of <a href="http://www.brenelz.com/blog/2009/02/03/squish-the-internet-explorer-z-index-bug/">IE's support for z-index</a> (or lack thereof), I finally found that the parent element of whatever div isn't being displayed correctly must also have a higher z-index than whatever you need to have appear behind it.</p>
<!--break-->
<p>So, for my example, I had a <code>div.popup</code> I wanted to appear above the rest of the page. I had to set <code>div.popup</code> and the <code>#header</code> div (which is the most senior parent-level div above div.popup) to have a z-index of something greater than the rest of the content, and also make sure that each element with a z-index property also has a <code>position</code> property set (such as relative, fixed or absolute).</p>
<h3>a:hover Background Colors &ndash; Where Art Thou?</h3>
<p>One of the simplest things in CSS, which almost always works perfectly across browsers, is the common set of <code>a:pseudo-classes</code>, such as a:hover, a:visited, a:focus, etc. &ndash; just use one of these selectors and put in a rule like &quot;background-color: red,&quot; and you're set to go.</p>
<p>For some reason, the a:hover rule <code>background-color: #FFF</code> wouldn't apply in IE6 for the main navigational tabs, even though it was perfectly fine in <em>every other browser</em>, and even though the 'color' rule worked in IE6. After much research (about half an hour on Google), I found a solution. You have to set a <code>z-index</code> and <code>position</code> property to the element you want an a:hover background color change on, because, apparently, the background color is changing <em>behind</em> the a:hover element's parent div! Quite ridiculous, if you ask me.</p>
<h3>Crossing the Borderline</h3>
<p>IE6 always has a funny way of handling borders. Especially in more complex layouts with lots of floats. One bug I often encounter is when IE6 decides to chop off the top and/or bottom borders on a block element. The tabs render fine (with a 1px border) in all other browsers, but look like someone grabbed a precision knife and simply sliced off one pixel of border. To overcome this, I used an IE6-only stylesheet and added the rule:</p>
<pre>
ul#primary-links li.parent a.parent { /* added to allow background color on rollover */
	position: relative;
	z-index: 100;
	border-top: 2px solid #64110a; /* Because 1px border gets lost */
	margin-top: -1px; /* To correct alignment of 2px border */
}</pre>
<p>(The two rules at the top were for the :hover bug mentioned previously). Instead of trying to fix the matter outright, I decided to simply throw my hands up and make the border a whopping TWO pixels in IE6, and then pushed the tabs back up one pixel (with a negative margin) to compensate for the extra pixel of (now-visible) border space.</p>
<h3>The Moral of the Story</h3>
<p>Track your website visitor stats, and see what browsers are most commonly used. This site, as well as a couple of my other more tech-inclined sites, has only 1-5% of its visitors using IE6. However, <a href="http://www.archstl.org/">Archstl.org</a> has a much older audience on average, as well as a large corporate audience, meaning IE6 users take up somewhere between 15-25% of the overall site visitors. This stat will change, but for now, this means I can't ignore developing (and hacking, and bugfixing) for IE6. &lt;/groan&gt;</p>
<p>If you are, like me, unfortunate enough to have to develop for this antiquated and horrible browser, Google is your friend &mdash; do searches for &quot;explorer 6 bug &lt;your problematic css element here&gt;.&quot; There's a plethora of information about how to fix oh-so-many problems... and it's often not <em>quite</em> as hard as you'd think.</p>
