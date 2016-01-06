---
layout: post
title: Stupid Flash – Making Menus Appear Over Flash Video/Content
author: Jeff Geerling
nid: 269
comments: true
redirect_from: /blog/oscatholic/stupid-flash-–-making-m/
created: 1274730733
---
<p>If you are using mega menus, like we use on archstl.org, then you need to be careful when posting Flash content to your website; if the content is anywhere around one of the mega menu flyouts, then the flash content will cover the menu in certain browsers (notably, IE and older FireFox versions).</p>
<p>To fix this, add the following code to your flash object embed:</p>
<p>Inside the &lt;object&gt; tags, with your other &lt;param&gt; tags: <code><param name="wmode" value="transparent"></code></p>
<p>Inside the &lt;embed&gt; tag, with the other value:key pairs: <code>wmode="transparent"</code></p>
