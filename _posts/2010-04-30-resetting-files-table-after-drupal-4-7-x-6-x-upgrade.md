---
layout: post
title: Resetting Files Table after Drupal 4.7.x -> 6.x Upgrade
author: geerlingguy
nid: 260
comments: true
redirect_from: /blog/oscatholic/resetting-files-table/
created: 1272644334
---
<p>At some point during the upgrade process from Drupal 4.7.11 to 6.16 (through versions of 5.x, with contributed module updates along the way), one of my sites&#39; files tables got screwed up. All the &#39;filepath&#39; entries were converted to &#39;filepath&#39; (instead of sites/example.com/files/filename.ext).</p>
<p>Luckily, since the original 4.7.x version of the site only saved files directly under the &#39;files&#39; directory, I could write a simple SQL query to update all the filepath entries in the files table:</p>
<pre>UPDATE files SET filepath = CONCAT('sites/reapteam.org/files/',filename);</pre>
<p>I ran that query, and it put in sites/example.com/files/filename.ext for each row in the table.</p>
<p>One caveat: If you ever saved files with ImageField, FileField, etc., under different subdirectories of your main files folder, and your filepaths were screwed up... well... good luck fixing that! I hope you have a backup :)</p>
