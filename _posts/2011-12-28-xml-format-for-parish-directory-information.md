---
layout: post
title: XML Format for Parish Directory Information
author: geerlingguy
nid: 419
comments: true
redirect_from: /wiki/117/xml-format-parish-directo/
created: 1325094895
---
For some time, developers on Open Source Catholic have been working on formalizing a standard for sharing Catholic Parish directory information online through a universal XML format, in the thread <a href="http://www.opensourcecatholic.com/forum/topics/346">Sharing Parish Directory Information Online</a>.

We are still in the early development stages of this format, and we would love your help and discussion in that thread. Below is the latest work on the format, which is changing rapidly. Until we have a set standard, consider the information on this page to be in early alpha stages.

A Drupal module to incorporate this format into a parish or diocese's Drupal website is currently being written: <a href="http://drupal.org/project/parish_info">Parish Info</a> (part of the <a href="http://www.opensourcecatholic.com/project/open-parish-website">Open Parish Initiative</a>).

<code>
<?xml version="1.0" encoding="UTF-8"?>
<parishdata xmlns="http://www.opensourcecatholic.com/parishdata">
  <parish>
    <id>1234567</id>
    <rite>Latin</rite>
    <name>St. Joseph's Church</name>
    <diocese>162</diocese>
    <url>http://www.paradise.com</url>
    <timezone>America/Chicago</timezone>
    <lastUpdated>2012-01-01T22:40:27-06:00</lastUpdated>
    <phone>1-314-444-4444</phone>
    <fax>1-314-444-4444</phone>
    <email>parish@example.com</email>
    <location>
      <street>777 Heaven Blvd</addressStreet>
      <street2>P.O. Box 2251</addressStreet2>
      <city>Eden</city>
      <state>Eternity</state>
      <zip>333333</zip>
      <latitude>33.823568</latitude>
      <longitude>119.542524</longitude>
    </location>
    <event type="mass">
      <day>Saturday (Vigil)</day>
      <start>16:30</start>
      <language>English</language>
      <location>Gym</location>
    </event>
    <event type="mass">
      <day>Sunday</day>
      <start>09:30</start>
      <language>English</language>
    </event>
    <event type="reconciliation">
      <day>Saturday</day>
      <start>16:00</start>
      <end>16:15</end>
    </event>
    <event type="adoration">
      <day>First Friday</day>
      <start>08:45</start>
      <end>10:30</end>
    </event>
  </parish>
</parishdata>
</code>

Some notes on this format:

<ul>
<li>lastUpdated date is in ISO 8601 format</li>
<li>The ID might not be known to the parish at the time the parish creates its information. Somehow we'll need the central server to designate a unique ID for each parish...</li>
<li>We'll need a standard format/list of Rites, Dioceses (see <a href="http://www.opensourcecatholic.com/wiki/117/php-array-list-all-united">PHP Array of Dioceses</a>), event types, etc.</li>
<li>Many attributes/fields are or should be optional or can be left empty (like geolocation, address line 2, phone, fax, and email...).</li>
</ul>
