---
layout: post
title: Dental Lab Website Re-Design
author: Cade_One
nid: 166
redirect_from:
  - /forum/topics/166/
created: 1259163600
---
<p><style type="text/css"></style></p>
<div><font size="2" face="Arial">
<p>I'm redesigning a website for some friends of mine (who also happen to be  Catholic).&nbsp; <strong>Okay, so here is my dilemma:</strong> I'm creating a custom template in  <em>Wordpress</em> (and let all the <em>Drupal</em> fans moan in unison ; )&nbsp; and I've created some  pretty cool rollover buttons that look and work great on the homepage, however,  when I click on an individual page or post, the menu bar collapses and then  disappears.&nbsp; I think I know what is causing this, but may need some  assistance!</p>
<p>The problem is that the Preload script and the Styles script is in the  &lt;head&gt; of the &quot;header.php&quot; file.&nbsp; Then the Onload script and the Slices  scripts are in the &lt;body&gt;.&nbsp; I think the problem is where I have my &lt;div  id=&quot;wrapper&quot;&gt; and &lt;div id=&quot;header&quot;&gt; placed.&nbsp; I have it placed in the  body, after the Onload script and before the slices scripts.&nbsp; Can you put the  &lt;div id=&quot;wrapper&quot;&gt; and &lt;div id=&quot;header&quot;&gt; in the &lt;head&gt;???</p>
<p>Please don't get mad at me, if I should know this.&nbsp; I'm kind of learning this  stuff on my own.&nbsp; When I was in college (10 years ago) web design was basically  HTML&nbsp;and Java.</p>
<p>Here is a before and after shot of what the site currently looks like (done  by someone else) and what it may look like if I figure this out.&nbsp; I'm trying to  keep a simple and clean look to the site.&nbsp; When I think of dental lab, I don't  want to see a black background, the generic navigational bar, and the old 90's  visitor's counter!&nbsp; It needs to look professional.</p>
</font></div>
<p><img width="508" height="600" align="middle" src="http://humblepod.com/images/temp/oldsite1.jpg" alt="Old Site" /></p>
<p>(Right-Click and &quot;View Image&quot; to see actual size)</p>
<p><img width="508" height="600" align="middle" src="http://humblepod.com/images/temp/newsite1.jpg" alt="New Site" /></p>
<p class="rteleft"><font size="2" face="Arial"><a href="http://humblepod.com/images/temp/hollandwoodsmiles/hollandwood_menu4.html">Here</a>  is what the menu should look like (which it works great on the home  page) <br />
</font></p>
