---
layout: post
title: Sharing Parish Directory Information Online
author: Jeff Geerling
nid: 346
redirect_from:
  - /forum/topics/346/
created: 1288733297
---
<p>I just recently got around to a task I&#39;ve been wanting to complete for quite some time: I have set up a (very rough, so far) feed on archstl.org listing ALL the parishes, and including their GeoRSS location data.</p>
<p>I&#39;m thinking of building out a standard for parish XML information&mdash;including things like contact information, website address, etc.&mdash;so that hundreds of different parish directories/databases could be, someday, merged into one open database.</p>
<p>Right now there&#39;s:</p>
<ul>
<li>http://catholic-mass-times.com/</li>
<li>http://www.parishesonline.com/scripts/default.asp</li>
<li>http://www.thecatholicdirectory.com/</li>
<li>http://www.churchmasstimes.com/</li>
<li>http://www.catholicweb.com/</li>
<li>...and many others</li>
</ul>
<p>Not to mention, hundreds of diocesan websites, parish websites, etc. that have duplicate (and often incorrect) data. Wouldn&#39;t it be amazing if parishes and dioceses could adopt a universal standard for sharing parish and sacramental information?</p>
<p>No longer would an already beleaguered parish secretary get 8 phone calls and 5 emails a year asking to update parish information across 20 different directories.</p>
<p>I can dream, can&#39;t I?</p>
<code>
<parish>
  <website></website>
  <email></email>
  <phone></phone>
  <masstimes></masstimes>
    <sunday></sunday>
    <monday></monday>
  <georss></georss>
  <picture></picture>
</parish>
</code>
