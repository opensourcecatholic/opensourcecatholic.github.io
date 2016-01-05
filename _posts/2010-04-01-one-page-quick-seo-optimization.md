---
layout: post
title: One-Page Quick SEO Optimization
author: Jeff Geerling
nid: 231
redirect_from:
  - /blog/oscatholic/one-page-quick-seo-optim/
created: 1270131912
---
<p>
	Today I had to make some updates to the <a href="http://archstl.org/archstl/page/archdiocese-st-louis-leadership">Archdiocese of Saint Louis&#39; Leadership page</a>. While I was making the updates, I noticed a pattern on the page that was very ineffective in terms of giving proper keyword metadata to Google for page links.</p>
<p>
	For each leader in the Archdiocese, there was a link to &quot;Read more...&quot; at the end of the leader&#39;s description. Google and other spiders take that &#39;Read more&#39; text and expect it to mean something, so they give a little weight (but not much) to the words &#39;read&#39; and &#39;more&#39; when searched in tandem with content on the page the words link to.</p>
<p>
	However, to give Google more context, and to let our pages get a tiny bit of extra <a href="http://www.opensourcecatholic.com/blog/oscatholic/want-some-free-link-juic">link juice</a>, I linked the names of the leaders directly to their pages (instead of &#39;Read more&#39; referring to Archbishop Robert J. Carlson, now &#39;Archbishop&#39; &#39;Robert&#39; &#39;J&#39; and &#39;Carlson&#39; refer to him!):</p>
<pre><span class="Apple-style-span" style="font-family: monospace; line-height: normal; white-space: pre-wrap; font-size: medium; "><span class="webkit-html-tag">&lt;a <span class="webkit-html-attribute-name">href</span>=&quot;<a class="webkit-html-attribute-value webkit-html-external-link" href="/archstl/page/archbishop-robert-j-carlson" target="_blank">/archstl/page/archbishop-robert-j-carlson</a>&quot;&gt;</span>Most Reverend Robert J. Carlson<span class="webkit-html-tag">&lt;/a&gt;</span></span>
</pre>
<p>
	Then I set all the &#39;Read more...&#39; links to rel=&quot;nofollow&quot;:</p>
<pre><span class="Apple-style-span" style="font-family: monospace; line-height: normal; white-space: pre-wrap; font-size: medium; "><span class="webkit-html-tag">&lt;a <span class="webkit-html-attribute-name">href</span>=&quot;<a class="webkit-html-attribute-value webkit-html-external-link" href="/archstl/page/archbishop-robert-j-carlson" target="_blank">/archstl/page/archbishop-robert-j-carlson</a>&quot; <span class="webkit-html-attribute-name">class</span>=&quot;<span class="webkit-html-attribute-value">readon</span>&quot; <span class="webkit-html-attribute-name">rel</span>=&quot;<span class="webkit-html-attribute-value">nofollow</span>&quot;&gt;</span>Read more...<span class="webkit-html-tag">&lt;/a&gt;</span></span>
</pre>
<p>
	This tells Google that it can disregard the &#39;Read more...&#39; link, and lets Google instead use the more contextually-sound link (with SEO terms built in).</p>
