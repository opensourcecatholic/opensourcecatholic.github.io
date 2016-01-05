---
layout: post
title: Mining the Catechism with Perl
author: Jeffrey Pinyan - Praying the Mass
nid: 50
redirect_from:
  - /blog/praying-mass/mining-catechism-perl/
created: 1247586521
---
<p>There are a few copies of the <em>Catechism of the Catholic Church</em> online, and they all have a very simple search interface.&nbsp; While this might be helpful when looking up words like &quot;Incarnation&quot; or &quot;Purgatory&quot;, these search interfaces are not very robust.&nbsp; What's more, they don't enable readers to identify paragraphs of the Catechism which make reference to a particular passage of Scripture.</p>
<p>Enter the <a href="http://japhy.perlmonk.org/bible/catechism.cgi">Catechism Search Tool</a> made available at <a href="http://thecrossreference.blogspot.com/"><strong>The Cross Reference</strong></a>.&nbsp; This utility, approved for use by the USCCB Subcommittee on the Catechism, enables Catholics (and others)&nbsp;to search and view the entire text of the Catechism -- paragraphs and footnotes -- in a variety of ways:</p>
<ul>
    <li>By reference to Scripture verses</li>
    <li>By text (exact phrase, all words, any words, partial words, even support for regular expressions)</li>
    <li>By paragraph number</li>
    <li>By Catechism section</li>
</ul>
<p>The full content of the Catechism is made available, including the cross-references between paragraphs.</p>
<!--break-->
<p>In addition to the Catechism Search Tool, there is a similarly-designed search tool for the <a href="http://japhy.perlmonk.org/bible/compendium.cgi?"><em>Compendium to the Catechism</em></a>.&nbsp; Also available is a <a href="http://japhy.perlmonk.org/bible/lectionary.cgi?">Lectionary Search Tool</a>, allowing you to find out the readings for a given liturgical day, or find the liturgical days which include a given Scripture passage.&nbsp; This tool provides paragraphs numbers from the <em>Catechism</em> whenever a Scripture passage is found in the <em>Catechism</em>.&nbsp; Last but not least is a <a href="http://japhy.perlmonk.org/bible/magisterium.cgi">Magisterium Search Tool</a> which provides robust text searching for over 100 documents of the Magisterium (going back nearly 150 years).</p>
<p>These search tools are all written in Perl.</p>
