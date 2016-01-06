---
layout: post
title: Tar/Gzip Directory without Preserving Directory Heirarchy/Structure
author: Jeff Geerling
nid: 338
comments: true
redirect_from: /blog/oscatholic/targzip-directory-withou/
created: 1287415112
---
<p>I just wanted to post this code snippet up here in case anyone else is stuck Googling for many hours without success how to do this...</p>
<p>I have a PHP script (actually, a Drupal module I&#39;m working on) set up to grab a folder, archive it using tar with the -z (gzip/compress) option, and post a link to the archive. However, since I was using PHP, I couldn&#39;t do what I normally do when tar-ing a folder, that is, I couldn&#39;t change directory (cd) first, then create the archive.</p>
<p>The problem this creates (for me) is that, upon expanding the PHP-created tar.gz archive, the system folder/directory heirarchy is expanded as well... so my files are buried in a folder 5-10 levels deep. Not ideal for zipping up a bunch of photos or something.</p>
<p>So, to overcome this problem, you can use tar&#39;s -C option, which allows you to change directory before tar-ing the files:</p>
<code>tar -C /directory/of/files-to-archive -zcvf /path/to/final-archive.tar.gz .</code>
<p>This simply creates an archive that expands to a folder with the archive&#39;s name, and has all the files contained directly inside!</p>
<p>My final command in the PHP script used the <a href="http://php.net/manual/en/function.exec.php">exec()</a> function, which allows command-line commands from a PHP script.</p>
