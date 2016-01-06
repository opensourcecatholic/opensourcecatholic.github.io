---
layout: post
title: Using Drupal with Amazon S3 to backup your site
author: JoaoMachado
nid: 296
comments: true
redirect_from: /forum/topics/296/
created: 1279243041
---
<p>I would like to share with you an extremely inexpensive and highly effective way to backup your Drupal sites (both MySQL and your /sites/default/files directory)</p>
<p>You will need two things;<br />
<br />
One is this module: <a href="http://drupal.org/project/backup_migrate" target="_blank">http://drupal.org/project/backup_migrate</a><br />
Second, you will need an Amazon S3 Account <a href="http://aws.amazon.com/s3/" target="_blank">&gt;here</a></p>
<p>How does it work? very simple, you create a Bucket (folder) in Amazon S3<br />
and then go into the Backup and Migrate module and enter your settings.</p>
<p>You can backup just the db or just the files directory or both. One of the best features is the ability to restore a backed up MySQL file, the module actually lists the backed up files, select the one you want to back up and it magically restores the db to the state of when the back up was done. This one has saved me a few times!</p>
<p>The cost? Well, I back up three sites, with one site having doing a 150MB four times per day is costing me $2.58 per month.</p>
<p>Oh, and that 150MB backup takes about 35 seconds!!</p>
<p><br />
&nbsp;</p>
