---
layout: post
title: Lectionary Web Service (alpha)
author: murdaugh
nid: 478
created: 1376084584
---
After looking (for too many years) for ways to scrape readings for a given celebration in some usable and predictable way, I decided to undertake creating a web service that returns liturgical reading citations (in JSON) given a date.

As of right now, it works for Sundays for the current remaining Liturgical year. God willing, by the time Advent rolls around, it will include all Sundays for the entire 3-year cycle. After that, we'll begin to tackle daily liturgies. This isn't hardcoded with dates and their readings, we have written an engine that is able to determine a specific celebration given a date.

Please explore, the URLs look like this: http://missal.cc/?date=08/11/2013&json=true 

If this web service is of use to you, we'd be happy to hear from you. We're thinking about coming up with a donation structure to keep the service free should developers around the church find use here. And, of course, if you'd like to help troubleshoot things like "When is the feast of St. Joseph if March 19th is a Sunday?" we'd love to hear from you.

Thanks!

Bryan
