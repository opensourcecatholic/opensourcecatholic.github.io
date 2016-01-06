---
layout: post
title: A Faster Drupal—a Faster Web
author: Jeff Geerling
nid: 454
comments: true
redirect_from: /blog/jeff-geerling/faster-drupal-faster-web/
created: 1348601391
---
I just sent a new note to the Flocknote Development list about <a href="http://www.flocknote.com/note/59251">making Flocknote speedier</a>. Flocknote is a very complex web application, and at the beginning of this summer, I noticed that some pages were taking more than a second to generate on our server (that's <em>before</em> the page would be sent to the end user!).

Investigating the performance problems using <a href="http://dev.mysql.com/doc/refman/5.0/en/using-explain.html">MySQL's EXPLAIN</a>, the PHP profiler <a href="https://github.com/facebook/xhprof">XHProf</a>, and Drupal's <a href="http://drupal.org/project/devel">Devel</a> module, I found the culprits to be some inefficient and memory-hungry caches and some inefficient database queries. Applying a couple patches that are in development for Drupal, and adding a couple indexes on different tables more than halved average page load time.

I also am actively trying to get these patches accepted into Drupal core and the Views module. Once the patches are incorporated, millions of other Drupal websites and applications will be able to conserve memory and clock cycles as well. You could easily substitute 'Wordpress', 'Joomla', 'DotNetNuke', or any other CMS or platform for 'Drupal' here.

When we shave milliseconds off page load times, or optimize CSS and JavaScript to conserve CPU time on an end user's computer or mobile device, we are not only <a href="http://googlewebmastercentral.blogspot.com/2010/04/using-site-speed-in-web-search-ranking.html">making end users happier</a>, we're effectively:

<ul>
<li>Conserving battery life, and thus recharging time—reducing power demands altogether.</li>
<li>Making end users enjoy (and thus continue) using our websites and products.</li>
<li>Allowing for more free memory and CPU time on our servers, which in turn increases capacity.</li>
</ul>

These are <em>very real</em> benefits of pursuing better performance. Do you performance test your code when you add new features? Do you run something like <a href="https://developers.google.com/speed/pagespeed/">Google PageSpeed</a> to make sure your fancy new scripted widget doesn't kill performance on older Android devices, iPhones, and PCs?

Just like with rampant misuse of Adobe Flash everywhere in the early part of this millenium, many people seem to be adding features, effects and widgets wily-nily to their sites and platforms with little regard for their frying servers or those using the sites. Do you <em>really</em> need a <a href="http://www.iangeorge.net/snippets/tags/">3D tag cloud</a> on your site, when it costs tons more time to generate on the backend, and tons of time to render in a browser?

Consider learning about improved performance techniques and incorporating performance testing in all the development you do—no matter what kind of software platform or website you're building. And if you can help large web platforms like Drupal, Wordpress and Joomla work faster using less memory, that's a win for everyone.
