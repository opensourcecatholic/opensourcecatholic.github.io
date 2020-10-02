---
layout: post
title: Set a View's Context Inside an Organic Group
author: geerlingguy
nid: 268
comments: true
redirect_from: /blog/oscatholic/set-views-context-inside/
created: 1274456575
---
<p>A very simple way to allow a view to display as if it were a page in an organic group on your Drupal site: Simply paste the code below in your view&#39;s Header or Footer, using the PHP Code input format.</p>
<p><?php og_set_group_context(node_load(46405)); ?></p>
<p>Note: the node ID inside node_load() must be set to the group into which you&#39;d like the view to display. To get this to function perfectly (as of OG 2.1), you might need to apply the patch in this issue on drupal.org: <a href="http://drupal.org/node/649630#comment-2987518">Group theme doesn&#39;t display on Views that take group as an argument</a>. (Otherwise the group&#39;s custom theme might not get set).</p>
<p>There are some <a href="http://www.midwesternmac.com/blogs/geerlingguy/getting-views-page-display-app">alternative methods to getting views to display inside groups</a>, but this is a quick and easy solution.</p>
