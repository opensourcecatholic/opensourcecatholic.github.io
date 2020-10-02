---
layout: post
title: Are you setting up your parish websites for failure?
author: geerlingguy
nid: 480
comments: true
redirect_from: /blog/jeff-geerling/are-you-setting-your/
created: 1381283317
---
Earlier this year, a study found that <a href="http://www.techhive.com/article/254694/religious_sites_carry_more_malware_than_porn_sites_security_firm_reports.html">religious websites have more malware than porn websites</a>. Unfortunately, this is not too surprising.

Pornography sites are often run by very profitable media conglomerates, and it's in their best interests to have reliable, fast websites. Religious websites (like your parish website, or a site for a small nonprofit) are often run on a shoestring budget and maintained by volunteers, if at all.

In the past, when websites were mostly static pages, and sites were hosted mostly on shared hosting, where the hosting provider provided (somewhat) timely server patches, leaving things be didn't cause much of an issue. But nowadays, with most parish websites running on Wordpress, Joomla, Drupal, or some other CMS that involves a database, PHP, Django, and/or other layers of services, leaving things be is a very, very bad idea.

Additionally, with many more developers and small development companies seeing the value of VPS hosting instead of shared hosting, servers themselves are lagging behind in terms of updated server software (Apache, PHP, MySQL, Linux, Rails, etc.). In fact, <a href="http://arstechnica.com/security/2013/08/once-the-domain-of-windows-xp-web-servers-are-hackers-target-of-choice/">web servers are targeted more than Windows XP by hackers</a>, mostly because so many are way behind on security updates (or have never been updated since they were originally built!).

<em>To web developers</em>: When you set up a dynamic website for one of your clients, do you include in the contract and training security patches and updates? If you don't, you can be assured some future security flaw will allow script kiddies and/or hackers to take over the website. Additionally, two years down the line, if you're still running a two-year-old system, it will be incredibly difficult to get things upgraded. Quarterly and/or monthly maintenance is an essential part of any contract for a modern website.

<em>To organizations and parishes hiring web developers</em>: Even if you have a tiny budget, you need to make sure you include ongoing patching and support from whatever company or individual you hire to create your website. Even if your site is run by volunteers, you need to make sure they know how important it is to keep your site running on the latest version of whatever CMS you're using.

It's getting easier and easier these days to, at a minimum, keep your CMS up-to-date (at least within a major version, like Wordpress 3.x or Drupal 7.x), so there's no excuse for your site becoming yet another vector for malware (at best), or becoming defaced and taken over by some nefarious group.
