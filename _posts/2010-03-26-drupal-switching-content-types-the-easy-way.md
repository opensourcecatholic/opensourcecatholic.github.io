---
layout: post
title: 'Drupal: Switching Content Types the Easy Way'
author: Jeff Geerling
nid: 228
redirect_from:
  - /blog/oscatholic/drupal-switching-content/
created: 1269626226
---
<p>
	One thing that I&#39;ve had to do every now and then is switch a node between one content type (for instance, &#39;story&#39;), and another (a new content type &#39;blog post&#39;).</p>
<p>
	I used to go into the database via PHPMyAdmin, and change the nodes in the node table, but that was getting quite tedious, and would take forever for a list of a hundred or thousands of nodes!</p>
<p>
	Instead, I wrote up a nice little script that you can paste directly into the &#39;Execute PHP&#39; block provided by the excellent Devel module:</p>
<?php
return;
// Paste the following into the 'Execute PHP' Devel page to update nodes to a certain content type.

// Put a comma-separated list of all the nids you'd like to change in this array
$nodes_to_switch = array(7402, 7409, 7410, 7411, 7412, 7413, 7414, 7415, 7416, 7418, 7419, 7420, 7421, 7422, 7423, 7424, 7428, 7429, 7429, 7430, 7431, 7432, 7433, 7434, 7435, 7435, 7436, 7437, 7438, 7438, 7441, 7442, 37143, 37144);

// This function will update all the nodes in the node table to the proper type
// You will need to change the type = '<typename>' to whatever you need:
foreach ($nodes_to_switch as $nids) {
  db_query("UPDATE {node} SET type = 'post' WHERE {node}.nid = %d", $nids);
  print "$nids - You have done one more nid!\n";
}
?><p>
	Just add a comma-separated list of node IDs you&#39;d like to switch, and run the script. Another nice thing about this approach is that you can use Views to generate the list; just set your Views filters, then use &#39;Fields&#39; as the display type, and then choose &quot;Node: nid&quot; for the only field to display. Copy out the list of nids, and paste them into the array.</p>
