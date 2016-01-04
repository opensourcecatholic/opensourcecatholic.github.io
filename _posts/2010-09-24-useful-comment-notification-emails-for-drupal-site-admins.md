---
layout: post
title: Useful Comment Notification Emails for Drupal Site Admins
author: Jeff Geerling
nid: 331
created: 1285308732
---
<p>I have, for some time, used the amazingly dexterous Rules module on my Drupal sites to receive email notifications when new comments were posted. I set up a Rule in the admin interface which would send an email if a new comment was saved on the site.</p>
<p>In the &#39;Message&#39; section of the Rule&#39;s &#39;send email to arbitrary address&#39; action, I would include a link to the commented-upon node, as well as the body of the comment text.</p>
<p>However, I wanted to also have a couple convenient links included: one link to allow me to quickly delete the comment (if the comment was spammy), and a link to edit the comment (sometimes I need to see the email address of the author, or change some wording if it&#39;s mildly inappropriate).</p>
<p>Luckily, <a href="http://drupal.org/project/rules">Rules</a> is well-acquainted with the similarly amazing <a href="http://drupal.org/project/token">Token</a> module, so all I had to do was enter the following in the &#39;Message&#39; (replacing what I had):</p>
<pre>There&#39;s a new comment on the post [node:title-raw].
--------------------------------------------------------------------------------
By: &quot;[comment_author:user-raw]&quot;
&quot;[comment:comment-body-raw]&quot;
--------------------------------------------------------------------------------
Commented-upon node: http://www.lifeisaprayer.com/node/[node:nid]

Comment Administration:
Delete this comment: http://www.lifeisaprayer.com/comment/delete/[comment:comment-cid]
Edit this comment: http://www.lifeisaprayer.com/comment/edit/[comment:comment-cid]</pre>
<p>Simple, but brilliant. Rules could be described that way.</p>
<p><em>Note: Check out this drupal.org page for <a href="http://groups.drupal.org/node/15928">more advanced comment notification options</a>.</em></p>
