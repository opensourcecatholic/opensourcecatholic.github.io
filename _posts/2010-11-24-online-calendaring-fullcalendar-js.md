---
layout: post
title: 'Online Calendaring: FullCalendar.js'
author: Jeff Geerling
nid: 357
redirect_from:
  - /blog/oscatholic/online-calendaring-fullc/
created: 1290613797
---
<p>In my always-continuing quest to find the perfect online calendar display/management solution, I have found the next level of calendar display/management bliss.</p>
<p>Previously, I was pinning all my hopes on Drupal&#39;s very robust, but often complex and confusing, <a href="http://drupal.org/project/calendar">Calendar.module</a>&nbsp;(in use by almost 50,000 websites&mdash;and for good reason&mdash;it&#39;s extremely adaptable). The module provides many different displays, and gives you the ability to link directly to a specific day/month/week... but it (a) is relatively slow to allow switching from month to month, (b) requires a rather complex view, with arguments, which can be confusing for first-time users, and (c) it takes patience to theme it well.</p>
<p>I love the Calendar module, and I still use it on a few sites where necessary, but I&#39;ve found a new contender that has nothing to do but improve; that condender is the <a href="http://drupal.org/project/fullcalendar">FullCalendar</a> module, which is based on the great <a href="http://arshaw.com/fullcalendar/">fullcalendar.js</a> jQuery-based calendar library by Adam Shaw.</p>
<p class="rtecenter"><img alt="Fullcalendar Display" height="245" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/calendar.png" title="" width="467" /><br />
This is IE. It&#39;s easy enough, though, to add better styling to a fullcalendar.</p>
<p class="rteleft">FullCalendar is simply a views display that takes a list of event nodes (as long as your node has a date/time attached, it will work), and displays them in a beautiful calendar display that works across all modern browsers, and even most mobile browsers (I&#39;ve tested Android, iOS 4, FF, Chrome, Safari, and IE so far).</p>
<p class="rteleft">I had a little trouble getting the calendar to display in IE6/7, but <a href="http://drupal.org/node/980180#comment-3749500">I supplied a quick patch</a> to fix that issue.</p>
<p class="rteleft">One thing I have yet to test is the performance of fullcalendar when displaying large batches of calendar items (in this case, calendar.module might be better&mdash;if you need to show thousands of events on a calendar from many years prior). The biggest calendar I have right now displays about 200 items. As time goes on, I could either simply let the list build to the point where fullcalendar slows a bit, or limit the date range so events from only the past few months show.</p>
