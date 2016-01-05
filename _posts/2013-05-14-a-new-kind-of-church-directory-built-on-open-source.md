---
layout: post
title: A New Kind of Church Directory, Built on Open Source
author: akavlie
nid: 470
redirect_from:
  - /blog/aaron-kavlie/new-kind-church/
created: 1368503990
---
I recently launched <a href="http://parish.io">a little site for finding Catholic parishes and mass times</a> called <em>parish.io</em>. It takes a very different approach to gathering parish info and mass times than other sites in this category. Not only is this approach beneficial to users (more accurate and complete mass schedules), I think it's of particular interest to other software developers.

Rather than relying on manual data entry, <em>parish.io</em> gathers all of its info by scraping diocese and parish sites. It took months of hacking to validate the concept and develop the scraping logic, and while it's not perfect (some parishes just don't have sites, or don't provide mass times, or put them in unparseable formats), overall I'm quite happy with the results I'm seeing. Here's what I used to build it:

<a href="http://www.python.org/">Python</a>: My programming language of choice. Database aside, everything that follows is a Python library.

<a href="http://lxml.de">lxml</a>: Don't be fooled by the name. lxml is just as capable of parsing HTML as XML, especially given its support for CSS selectors (similar to jQuery). It's very fast, and ably handles most poorly formed HTML. Some people are partial to the API in <a>BeautifulSoup</a>, but a few small hangups aside, lxml has performed so well that I've never been very tempted to switch.

<a href="http://docs.python-requests.org/en/latest/">requests</a>: A simple and elegant API for HTTP requests. It's quickly become the favorite for HTTP in Python, simply due to its superior API over the standard library's <a>urllib2</a>.

That toolset accounts for most of the heavy lifting in scraping sites. As for the site itself, I used <a href="http://flask.pocoo.org/">Flask</a>, a simple and very well-documented web framework; the <a href="http://www.sqlalchemy.org/">SQLAlchemy ORM</a> talking to a <a href="http://www.postgresql.org/">PostgreSQL</a> database, and critically, <a href="http://postgis.net/">PostGIS</a> for geo queries (i.e. lookup by zip code, city, or nearby).

All of the above are open source, with very friendly licensing terms
that will work for any project, whether open or closed source.

If any of this is of interest to you, check out these projects. And be sure to 
<a href="http://parish.io">give parish.io a try</a> too!
