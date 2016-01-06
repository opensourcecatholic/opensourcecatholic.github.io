---
layout: post
title: How to make "Tweet This" or "Post to Facebook" links
author: Jeff Geerling
nid: 159
comments: true
redirect_from: /blog/geerlingguy/how-make-tweet-or-post-/
created: 1247561824
---
<p>If your website has an audience comprised of many Facebook and/or Twitter users, you might be thinking of ways you can get them to share your postings on Facebook and Twitter.</p>
<p>Currently, most blogs, sites, etc. either do this one of two ways: They require the user to copy out the URL from the address bar, then paste it into a Facebook status update or a Twitter posting (sometimes also having to go through the TinyURL service as well!), or they have a '<a href="http://sharethis.com/">share this</a>' or '<a href="http://www.addthis.com/">add this</a>' button hosted by a third party site.</p>
<p>But what if you want to keep things simple, and stick to a plain old, no-frills text link, or keep your focus mainly on one of the two giants: Facebook or Twitter? Well, turns out, the process is pretty simple: just take one of the two URLs below, and after the end, add in the link and/or text you'd like people to share via a status update.</p>
<ul>
    <li><strong>Facebook</strong>: <code>http://www.facebook.com/share.php?u=</code> &lt;add your link here&gt;</li>
    <li><strong>Twitter</strong>: <code>http://twitter.com/home?status=</code> &lt;add your link and/or text here&gt;</li>
</ul>
<!--break-->
<p>In both cases, you could just get by with pasting in your URL. For instance, if I want you to be able to share this post on Facebook, I can use the following link:</p>
<p class="rteindent1"><code>http://www.facebook.com/share.php?u=http://www.opensourcecatholic.com/articles</code></p>
<p class="rteindent1"><a href="http://www.facebook.com/share.php?u=http://www.opensourcecatholic.com/articles">Same as above, but an actual link</a>.</p>
<p>Twitter can go a step further; you can actually put the text you want people to tweet right in the link, like so:</p>
<p class="rteindent1"><code>http://twitter.com/home?status=New post on Open Source Catholic! View it at http://www.opensourcecatholic.com/articles</code></p>
<p class="rteindent1"><a href="http://twitter.com/home?status=New post on Open Source Catholic! View it at http://www.opensourcecatholic.com/articles">Same as above, but an actual link</a>.</p>
<p>This works great for one-off links, but you can actually put something like this into your website or blog's template (if you use a Content Management System), so that every single post you make has an automatically generated 'tweet this' or 'share on facebook' link. There are some pre-built modules or widgets that do this for you in Wordpress, Drupal or Joomla, but for ultimate control, you can do it yourself.</p>
<p class="rtecenter"><img alt="Share icon sets - RSS OPML Share this Geotagging" width="276" height="67" src="/sites/opensourcecatholic.com/files/user-uploads/geerlingguy/share-icon-sets.png" /></p>
<p>Finally, if you're looking for a cool and recognizable icon for your 'social sharing' links, look no further than the open-sourced <a href="http://shareicons.com/">Share This</a>&nbsp;link icon, which was created to clean up the clutter of a hundred social sharing logos. (It's similar to the standard and open-sourced <a href="http://www.feedicons.com/">RSS icon</a>, as well as the other <a href="http://www.openshareicons.com/">Open Sharing</a> icons...).</p>
