---
layout: post
title: Oh IE, how I Hate Thee
author: geerlingguy
nid: 187
comments: true
redirect_from: /blog/oscatholic/oh-ie-how-i-hate-thee/
created: 1260909824
---
<p>
	Oh Internet Explorer... how many times have I encountered your nasty little bugs? How many hours have you caused me to lament the fact that you exist?</p>
<p>
	Today I was working on a design for the upgraded Archdiocese of Saint Louis website (more to come in the future!), and encountered a nasty little bug in Internet Explorer having to do with CSS list positioning. Apparently, if you define an a element inside a list with &quot;display: block,&quot; but don&#39;t set a width on the parent element (the li, and then the ul, in this case), the li elements will get an extra few pixels of margin applied below each list element.</p>
<p>
	The fix is to add a couple lines to your IE-specific conditional stylesheet (for IE 7 and below only&mdash;IE 8 fixes this bug), as <a href="http://www.456bereastreet.com/archive/200610/closing_the_gap_between_list_items_in_ie/">outlined in this article</a>.</p>
<p>
	Thank you for wasting another hour of my time, Microsoft.</p>
<p>
	End result:</p>
<p class="rtecenter">
	<img alt="Archdiocesan Archives Menu" height="229" src="/sites/opensourcecatholic.com/files/user-uploads/oscatholic/archives-menu-archstl.png" width="234" /></p>
