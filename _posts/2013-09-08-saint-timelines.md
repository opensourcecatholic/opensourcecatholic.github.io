---
layout: post
title: Saint Timelines
author: liangjh
nid: 479
redirect_from:
  - /blog/jonathan-l/saint-timelines/
created: 1378614538
---
It has been several months since we launched the initial version of <a href="http://saintstir.com">Saintstir</a>, a 21st century taxonomy and social site centered around the saints of the Catholic Church.  It comes with an API for application developers as well (check out our <a href="http://www.saintstir.com/developers">developers</a> page).

This month we're pleased to announce our first version of <a href="http://www.saintstir.com/timeline">Saint Timelines</a>.  Its an interactive timeline that displays all of the saints on saintstir by feast day, centuries, as well as european historic periods.  Its a great resource that combines a chronological view of the saints with one of the most slick user interface plugins around.

The technology:
1.  Timelines rendered with the plugin <a href="http://timeline.verite.co/">TimelineJS</a>
2.  HTTP-JSON based API
3.  Caching on memcached
4.  Leverages the flexibility of taxonomy schema

(see our <a href="http://www.opensourcecatholic.com/blog/jonathan-l/saintstircom">previous blog post</a> for details on the rest of the technology stack that powers saintstir.com)
