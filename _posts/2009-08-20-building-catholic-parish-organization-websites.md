---
layout: post
title: Building Catholic Parish/Organization Websites
author: Jeff Geerling
nid: 113
created: 1250735231
---
<p>I don't know how many times I've now been contacted about building custom Church websites for various parishes, organizations, and ministries... and most of the time I am unable to accept these requests. I think our Church is finally at the point where the greatest hurdle is not necessarily pastors/leaders misunderstanding the importance of a good web presence, but the lack of great tools for building that presence.</p>
<p class="rtecenter"><img alt="Ugly and not so ugly websites." width="595" height="252" src="/sites/opensourcecatholic.com/files/user-uploads/geerlingguy/ugly-websites-parishes.jpg" /></p>
<p>I've seen site-building services such as www.eCatholicChurches.com, www.CatholicChurchWebsites.com, and www.ChurchAddress.com, but <strike>have a few problems with them</strike> (note: please read through the comments below this post for some good discussion about the issues at hand):</p>
<!--break-->
<ol>
    <li>The expense of running a website through one of these services &mdash; it often costs $30-80/month! A lot of parishes simply can't devote $500-1000/year to a website.</li>
    <li>The need... <em>still</em>... for a parish 'webmaster' (someone to update the content).</li>
    <li>The lack of any kind of recognition by the Church; <strike>I can't even tell if there are any Catholics affiliated with these organizations.</strike>&nbsp;(Again, see responses below). Do they truly have what's best for the Church in mind, or are these sites simply trying to make as many dollars as they can and taking parishes for a ride?</li>
    <li>The sites often are very 'cookie-cutter-esque,' and are not very well made for searchability, accessibility, and usability.</li>
</ol>
<p>Granted, many parish websites are horribly bad when they are set up for free by some self-assigned parish 'webmaster' (I really dislike that term; seems so early-90s!), and the aforementioned services are leaps and bounds better than the ugly animated-GIF-infested parish pages. But I think we can do better.</p>
<h3>Parishes as Communities of Faith</h3>
<p>If parishes are truly supposed to be devoted and faithful communities in real life, why can't we turn that community-mindedness over to parish websites as well? And can't we find a way to help parishes&mdash;many with little to no budget for a website&mdash;have some sort of parish community site?</p>
<p>Essential features would be:</p>
<ol>
    <li>A calendar of events; anyone can add an event, and the event can be approved by whomever the parish designates with that authority.</li>
    <li>Organization/Ministry pages; able to be updated (news stories, calendar items) by whomever is in that parish organization or ministry.</li>
    <li>Pastor's Blog (and associates, if need be); able to be easily updated by the Pastor, and with podcast capabilities if he so chooses. Comments can be on or off. RSS feeds are a <em>must</em>.</li>
    <li>An informational page, with Mass times, contact info, and other Sacrament times (ideally, this page would also automatically generate an XML or JSON file which sites like <a href="http://www.flocknote.com/">FlockNote</a> and MassTimes could use to automatically update their databases.</li>
    <li>Easily buildable online forms - for registration, baptism, etc.</li>
    <li>Donation systems (or an integrated donation system for Archdioceses) &mdash; able to use PayPal, eAuthorize, or some other standard and trusted system.</li>
    <li>Photo Galleries &ndash; parishioners might be able to upload their own photos from parish and school events to share with others.</li>
    <li>(Possibly:) A way to integrate a school website... although school websites are a whole different beast, in many ways.</li>
</ol>
<p>To set up one website like this, using Drupal, would take a few hours at least, and then a few more for a custom theme. However, if we were to make a Drupal installation profile (like the <a href="http://openatrium.com/">Open Atrium</a> project does), we could have a quick and easy site setup for multiple parishes, and the only concern would be hosting and bandwidth... which I would hope (Arch)Dioceses, and possibly also bishop's conferences, could help pay for.</p>
<p style="width: 450px; text-align: center; margin-left: auto; margin-right: auto;"><img alt="Open Atrium Sample - Calendar Screen" width="400" height="344" style="padding: 2px; border: 1px solid #999;" src="/sites/opensourcecatholic.com/files/user-uploads/geerlingguy/open-atrium-example.jpg" /><br />
Open Atrium is a project management system / Intranet powered by Drupal and is very easy to set up using an installation profile.</p>
<p>With Drupal, we could maybe set up one server/VPS for each (Arch)Diocese, and have a Drupal multisite installation, with a site for each parish (if nothing else, you could set up something like parish-name.archdiocese.com for each parish).</p>
<p>Any takers? If not, I will keep this on my back-burner for a while until I get more time to work on it ;-)</p>
