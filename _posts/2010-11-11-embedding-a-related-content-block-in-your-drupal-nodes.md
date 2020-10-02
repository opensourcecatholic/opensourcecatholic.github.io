---
layout: post
title: Embedding a 'Related Content' block in your Drupal nodes
author: geerlingguy
nid: 352
comments: true
redirect_from: /blog/oscatholic/embedding-related-conten/
created: 1289500376
---
<p>Many of my favorite websites offer a nice little feature, immediately following the body of the page, that highlights 3-5 &quot;possibly related&quot; stories or blog posts. I wanted to do this on OSC and some other sites, but found that it&#39;s difficult to add regions inside of nodes&mdash;the closest I could get with the default theme/block behavior is to have it appear after comment section, which is too far down the page to be relevant.</p>
<p>I decided to use the <a href="http://drupal.org/project/featured_content">Featured Content</a> module to create my blocks, as it offers a good amount of customization as to what kind of algorithms it uses to find related nodes... performance considerations aside. There are other ways to go about creating lists of related nodes, but this was quick and easy.</p>
<p>Adapting a solution I found <a href="http://drupal.org/node/753516#comment-2769068">here</a>, I created a simple function inside my template.php file that allowed me to print a block from inside my node.tpl.php template.</p>
<p>Inside template.php:</p>
<?php
/**
 * Helper function for retrieving block code for insertion into templates.
 *
 * @see http://drupal.org/node/753516#comment-2769068
 */
function osc_block_retrieve($module, $delta) {
  $block = (object) module_invoke($module, 'block', 'view', $delta);
  $block->module = $module;
  $block->delta = $delta;
  return theme('block', $block);
}
?>
<p>Inside node.tpl.php:</p>
<code>
<?php
  <?php if ($page): ?>
    <div class="block-in-node">
      <?php print osc_block_retrieve('featured_content', '1'); ?>
    </div>
  <?php endif; ?>
?>
</code>
<p>I chose to rank related nodes first by similar taxonomy terms, then by how many views the node received (I&#39;m using the statistics module on this site).</p>
<p>Alternatively, you could do one of the following to accomplish the same kind of thing:</p>
<ul>
<li>Set up a region inside your nodes, in the node.tpl.php file. This seems to be a little burdensome, though, unless you&#39;re planning on doing many different things inside said region(s).</li>
<li>Use the <a href="http://drupal.org/project/panels">Panels</a> module to add blocks inside of nodes, or in a different kind of page layout.</li>
</ul>
