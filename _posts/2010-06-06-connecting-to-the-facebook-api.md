---
layout: post
title: Connecting to the Facebook API
author: Jeff Geerling
nid: 276
comments: true
redirect_from: /wiki/117/connecting-facebook-api/
created: 1275807932
---
<p>Facebook has a lot of data available to website developers through their Open Graph API, and Facebook also offers a ton of nice features to web developers to tie into Facebook&#39;s user profiles, commenting system, &#39;Like&#39; system, etc.</p>
<p>While it may be argued how tightly your site should integrate with Facebook for a user&#39;s interaction with your site (do you really want something as essential as login to depend on an external service?), it is not a hard decision to allow some degree of Facebook integration with your site&mdash;after all, many of your site&#39;s users are likely Facebook users already, and they will be more likely to already be familiar with Facebook functionality and terminology.</p>
<p>To get started integrating Facebook features into your site, you can read through <a href="http://developers.facebook.com/docs/">Facebook&#39;s Developer documentation</a>, and after you have set up your own Facebook account, you can add the &#39;<a href="http://www.facebook.com/developers/">Facebook Developer App</a>&#39; to your profile, then click the &#39;Set Up New Application&#39; button to add an App to facebook that integrates with your website (for the App&#39;s title, enter the name of your site, or whatever you&#39;d like).</p>
<p>If you&#39;re using PHP for your website (who isn&#39;t?), you can download <a href="http://github.com/facebook/php-sdk/downloads">Facebook&#39;s PHP SDK</a>, and get started building Facebook integration into your website.</p>
<p>An example of Facebook integration offered on Open Source Catholic is the fan page follower counts for the Archdiocese of Saint Louis. Following kovshenin.com&#39;s guide &quot;<a href="http://kovshenin.com/archives/how-to-count-facebook-fans-in-php/">How to Count Facebook Fans</a>,&quot; we came up with the following PHP code to get a follower count for a particular page:</p>
<?php
// This is where you put the facebook.php file downloaded from the Facebook PHP SDK site
require_once('sites/all/libraries/facebook-php/src/facebook.php');

$facebook = new Facebook(array(
  'appId'  => 'YOUR_APPID_PASTED_HERE',
  'secret' => 'YOUR_SECRET_PASTED_HERE',
  'cookie' => true,
));

$result = $facebook->api(array(
	'method' => 'fql.query',
	'query' => 'select fan_count from page where page_id = YOUR_PAGE_ID_PASTED_HERE;'
));

$fb_fans = $result[0]['fan_count'];

print '<p>The Archdiocese of St. Louis has $fb_fans Fans.</p>';
?><h2>Other Facebook Features</h2>
<p>One of the easiest parts of Facebook you can integrate is the &#39;Like&#39; button - Facebook lets its users &#39;Like&#39; any page, comment, status update, etc. across the web, and you can embed a small snippet of code in your blog or website to allow users to &#39;Like&#39; a page.</p>
<p>For instance, here&#39;s a like button embedded on this page:</p>
<iframe src="http://www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.opensourcecatholic.com%2Fwiki%2F117%2Fconnecting-facebook-api&amp;layout=standard&amp;show_faces=false&amp;width=450&amp;action=like&amp;colorscheme=light&amp;height=35" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:35px;" allowTransparency="true"></iframe>
<p>More information about the Like button, and other simple Facebook feature integrations, can be found on Facebook&#39;s &quot;<a href="http://developers.facebook.com/docs/guides/web#plugins">Facebook for Websites</a>&quot; page.</p>
