---
layout: post
title: Setting up an Apache Solr Search Server (for many sites/hosts)
author: Jeff Geerling
nid: 289
redirect_from:
  - /blog/oscatholic/setting-apache-solr/
created: 1277828235
---
<img src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/magnifying-glass.jpeg" alt="Magnifying Glass" title="" style="float: right; width: 225px; height: 169px; margin: 10px;" />[<strong>Update</strong>: I now use Midwestern Mac, LLC's <a href="http://www.midwesternmac.com/services/hosted-solr-search">hosted Apache Solr search for Drupal</a> to host Solr; it's a lot easier than setting up (or even needing) a VPS for Solr.]

In the <a href="http://archstl.org">Archdiocese of St. Louis</a>, I manage more than 15 separate Drupal websites (plus a few others), and I have often wanted to use <a href="http://lucene.apache.org/solr/">Apache Solr</a> for search across all these sites. I finally had some time to tackle this issue, and I have a pretty good (and very fast) Solr server set up, and this server is shared across all these sites on two (so far) different webservers through two different hosting companies.

The main Archdiocesan sites (<a href="http://archstl.org">archstl.org</a>, <a href="http://archstldev.com">archstldev.com</a>, and <a href="http://stlouisreview.com">stlouisreview.com</a>) are all hosted via SoftLayer in Dallas, while Catholic Youth Apostolate sites (like <a href="http://stlyouth.org">stlyouth.org</a> and <a href="http://www.cycstl.net">cycstl.net</a>) are hosted via Hot Drupal in North Carolina.

I was able to set up a linode (<a href="http://linode.com">linode.com</a>) for less than $20 to run Apache Solr via Jetty, and that server is then accessible to all our other servers to send and receive search index data. This solution allows our main web servers to keep resources free from expensive MySQL search queries and the large databases that result from storing 20k+ nodes' search data in the main site DB.

You can find <a href="http://archstldev.com/node/319">the process by which I set up the search server in this issue</a> on the Development website. The best thing about this system is that I can really make the search server fly; ping takes about 30-40ms between the search server and our other servers, and queries only take about 150-250ms to reach the websites.

Any large organization looking to vastly improve search performance (and usability), especially on a Drupal site (it's so easy, with the <a href="http://drupal.org/project/apachesolr">Apache Solr Search Integration</a> module pluggable right out of the box), should look into setting up a dedicated search VPS or server (depending on your search traffic).

Our linode Solr server typically sits close to idle, even at peak hours (right now it's showing 0.00, 0.00, 0.00), and I'll probably set it up to do some other tasks off-site as well, since it has the spare CPU, memory and disk space available (and a really fat pipe to the Internet!).
