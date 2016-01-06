---
layout: post
title: Plan for Emergencies—Before they Happen
author: Jeff Geerling
nid: 257
comments: true
redirect_from: /blog/oscatholic/plan-emergencies—-they-h/
created: 1272482274
---
<p>I was recently emailed by an organization who has recently had their website go belly-up, and they lost most of their recent data. Their development company supposedly has some backups, but are not being the best of communicators right now (it can happen to the best of us).</p>
<p>So, in the email, I was asked to offer my help in getting their site back online. Unfortunately, I can do just about nothing, since the organization has no backups, no data, not even an old database backup.</p>
<p>If you run a website, do the following <em><strong>right now</strong></em>:</p>
<ol>
<li><strong>Set up an automated weekly or monthly backup</strong> of the entire website (daily, if your data merits that level of backup), including the site database, in case of catastrophe. Keep it locally (i.e. within your offices, or on an accessible backup server). This way, even if your developer goes belly-up, you can transfer the backup to someone else and quickly get back up and running (within a day or two). (I might do a post on how the Archdiocese maintains weekly backups of everything in two separate locations soon...).</li>
<li><strong>Develop a site maintenance and upgrade plan</strong>; with content managed websites, maintenance and security patches must be applied on a monthly or quarterly basis (I do it every week on the Archdiocesan website), otherwise maintenance and upgrade costs will go through the roof in as little as a year&#39;s time.</li>
</ol>
<p>Do these things, and nobody gets hurt.</p>
<p>It&#39;s also good practice to have more than one developer in your rolodex (er... iPhone?), in case your main developer is inaccessible. Better yet, have someone on-staff who can help in a pinch (or full time!).</p>
