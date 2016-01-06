---
layout: post
title: Open Access to the Catholic Bible and Catechism (NAB/NABRE and CCC)
author: Jeff Geerling
nid: 417
comments: true
redirect_from: /blog/jeff-geerling/open-access-catholic/
created: 1324964222
---
<img src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/Jeff%20Geerling/nabre-bible-leather.jpg" alt="Holy Bible - NAB Revised Edition - Leather bound" width="180" height="300" style="float: right; margin: 8px;" />After seeing about <a href="http://twitter.theinfo.org/149560641345159168">50 responses on Twitter</a> to a casual comment about the USCCB not being able/willing to allow open access to the <a href="http://old.usccb.org/nab/bible/">Bible</a> (NAB or NABRE translation) or <a href="http://old.usccb.org/catechism/text/">Catechism of the Catholic Church</a> to developers like me (and many others), I thought I'd simply post here all the information I have about the current situation, and what might be able to be done to remedy this situation...

[I set up <a href="http://www.change.org/petitions/united-states-conference-of-catholic-bishops-open-up-access-to-the-nabre-and-catechism">this little petition</a> just to allow people to voice support. Petitions don't help change things in the Church, but it's good to see what kind of things people would like to see happen!]

<h3>Correspondence with USCCB about licensing/access</h3>

I have contacted the USCCB twice now, asking once on behalf of the Archdiocese of St. Louis (I used to work there as Director of Web Development), and once on behalf of flockNote, Open Source Catholic, and Midwestern Mac. Both emails asked a simple question: Is there any way I could get access to the<strong>&nbsp;only</strong>&nbsp;USCCB-approved biblical translation and CCC translation so I could use these translations in mobile apps and websites?

I was hoping to see if they would offer the works under some sort of free license that would allow Catholic developers the ability to build apps including Catholic bible texts and CCC integrations (something like the <a href="http://itunes.apple.com/us/app/westminster-shorter-catechism/id357433595?mt=8">Westminster Shorter Catechism in 90 Days study guide app</a>, but for Catholics). But the responses I've received have been less than encouraging—see the forum topic <a href="http://www.opensourcecatholic.com/forum/topics/84#comment-1822">Public Domain Catholic Bibles</a> for the full details.

The gist of their responses: They have things 'in the works', and anyone can get the bible and CCC on Kindle ('for a low price...'), and they're working to allow brief excerpts (but definitely not a whole chapter or section) to be emailed to people.

<h3>Current Access to Catholic Catechisms and Bibles</h3>

Currently, there's a $17 Catechism for the Kindle (where the paperback version is $9), as <a href="https://twitter.com/brandonvogt1/status/149189090997309441">mentioned by @BrandonVogt1</a> on Twitter. He appropriately tagged that with the #EvangelismFail tag... why is this not free in eBook format, at a minimum?

And the ONLY canonical source for these texts is the USCCB website, which is still set up like a 90s era website, with a link structure by which people can access any book of the bible, or chapter, but there's poor/no search ability, and it's hard to actually discover topical information, or find particular topics or indexes of either the Bible or the Catechism on the USCCB's website.

There are a few companies who have paid (large?) licensing fees to the USCCB to use the official translations in their software and websites—one in particular is the <a href="http://www.logos.com/product/9355/new-american-bible-rev-ed">Logos bible software</a>, which charges $17 on top of the fee for their software for access.

<h3>Resolution</h3>

The most helpful thing the USCCB could do is allow completely free and open access to the texts of both the NABRE and CCC by anyone. But as I see this is quite unlikely to happen (but I'd be very happy to be surprised!), I think something like the following could be more amenable:

The USCCB could have a NABRE/CCC API available to developers—could be something simple like JSON or something—and developers could send a request for, say, CCC #2150, and their API would return the contents of that section.

To gain access to this API, a developer would simply need to register an account and authorize access, getting a token in the process that would allow them to request up to one chapter of the bible at a time, and one section (or a group of sections) from the CCC at a time.

If the API tracked calls, then developers would be allowed a certain number of calls per day for free; any more than that, and the developer would need to pay some small fee per month/quarter/year.

Developers could cache the results of API calls for a certain period of time—say, 1 day, 1 week, or 1 month—so their apps and sites would be able to run faster. But data would need to be refreshed to ensure the integrity of the translation, including any textual updates.

I don't know if this is going to happen, and I don't think it will, but I pray that this might possibly be considered someday. (<a href="http://www.opensourcecatholic.com/blog/oscatholic/what-if">I've talked about this before</a>, but got no traction).

If I, as a Catholic developer, have to continue to use old English translations of the Bible from the Vulgate, or the King James Version (not even Catholic!), I'm at a major disadvantage. <a href="http://en.wikipedia.org/wiki/Information_wants_to_be_free">Information wants to be free</a>—and right now, some of the fundamental parts of our faith are locked up under strict licensing restrictions.
