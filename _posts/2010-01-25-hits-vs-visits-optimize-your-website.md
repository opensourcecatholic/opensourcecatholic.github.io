---
layout: post
title: Hits vs. Visits - Optimize Your Website!
author: Jeff Geerling
nid: 203
created: 1264438019
---
<p>
	Recently, I&#39;ve been tracking visits on two of the larger Archdiocesan websites on our Archdiocesan web server, and I found an interesting anomaly (one that I had thought was odd earlier, but didn&#39;t really have hard numbers to decipher it until more recently). Check out the hits (a &#39;hit&#39; is a file downloaded from the web server to a computer) for the entire www.archstl.org domain:</p>
<p class="rtecenter">
	<strong>Hits for Archstl.org and StLouisReview.com:</strong><br />
	<img alt="Hits Counter - Urchin 6" height="88" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/hits-archstl-review.png" title="" width="459" /></p>
<p>
	173,000 hits on archstl.org vs. 44,000 hits on the St. Louis Review website.</p>
<p>
	Sounds reasonable, right? After all, the Archdiocesan website incorporates over 49 different &#39;subsites&#39; - for education, cemeteries, the missions, the Catholic Youth Apostolate, etc. There are about 4 hits on archstl.org to every hit on the Review site.</p>
<p>
	So, you would expect that the number of visitors would be proportionate, no?</p>
<p class="rtecenter">
	<strong>Visitors for Archstl.org and StLouisReview.com:</strong><br />
	<img alt="Visits Counter - Urchin 6" height="87" src="http://www.opensourcecatholic.com/sites/opensourcecatholic.com/files/user-uploads/oscatholic/visits-archstl-review.png" title="" width="454" /></p>
<p>
	Woah! Wait a second... <strong>the Archdiocesan site had four times the number of hits</strong>&mdash;how does it have only 75% of the visitors of the Review site?</p>
<p>
	The problem here is a highly unoptimized site structure and file system, which, in high-traffic conditions, could (and, in fact, did, a couple times) bring a web server to its knees.</p>
<p>
	Right now, on www.archstl.org, each of the 49 subsites has its own template folder, with its own images and template files. This means that if you go to www.archstl.org, then click on a link to www.archstl.org/education, you&#39;re basically going to an entirely different website (in terms of file structure, and you have to re-download the entire template, and all the files...</p>
<p>
	Nevermind simply following YSlow&#39;s suggestions and optimizing file etags/gzip! If the same file is accessed at /templates/archstl/image.png and /education/templates/archstl/image.png, it has to be downloaded <em>twice</em>.</p>
<p>
	We&#39;re working on remedying this situation, but it&#39;s a good idea to keep tabs on these kinds of stats, just to make sure you know where potential site performance problems lie.</p>
<p>
	If two or three of the sites on www.archstl.org had a large volume of visitors in a matter of minutes, the server would go down in flames. Luckily, <a href="/blog/geerlingguy/caching-page-saving-server">this has only happened once</a> (and we responded pretty quickly), but in my mind, our infrastructure, site design, and filesystem should take performance into account.</p>
