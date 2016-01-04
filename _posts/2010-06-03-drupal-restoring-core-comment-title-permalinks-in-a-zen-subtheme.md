---
layout: post
title: 'Drupal: Restoring core comment title permalinks in a Zen Subtheme'
author: oscatholic
nid: 273
created: 1275601229
---
<p>I was scratching my head after trying to troubleshoot a template problem for a few hours today; I was building a Zen subtheme for a site that had, until now, been using Garland for it&#39;s styling. In this subtheme, I wanted to have comments display with a similar look to Garland, and I especially wanted automatic permalinks to comments, referenced by a comment number:</p>
<p class="rtecenter"><img alt="Comment template - zen removes linked comment number titles." height="302" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/zen-comment-template.png" title="" width="600" /></p>
<p>I looked through comment.tpl.php, and my template.php file, as well as zen&#39;s template.php file, but couldn&#39;t find anything related to the $id variable, which is used to build the numbered permalink. After opening up Devel themer, I found that there was a call to _zen_preprocess_comment(), and that was the likely culprit...</p>
<p>To restore these comment numbers/permalinks, you will need to grab core&#39;s <a href="http://api.drupal.org/api/function/template_preprocess_comment/6">TEMPLATE_preprocess_comment</a> function and place it in your subtheme&#39;s template.php file. (This is an easy fix... if you&#39;d like to get more advanced, you can hack the code to do other more Zen-like things, like print &#39;first&#39; and &#39;last&#39; classes for comments).</p>
<p>Be sure to change TEMPLATE to the name of your theme!</p>
<p>After you do that, your theme should have comment styling very similar to that of other core themes, with the permalink comment number intact (see below for the final product).</p>
<p class="rtecenter"><img alt="Pretty Zen comment titles - numbered permalinks!" height="316" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/pretty-zen-comment-titles.png" title="" width="600" /><br />
(numbered permalinks ftw!)</p>
