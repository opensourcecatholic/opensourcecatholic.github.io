---
layout: post
title: Embed Google Wave
author: mdhoerr
nid: 209
comments: true
redirect_from: /blog/mdhoerr/embed-google-wave/
created: 1265834652
---
<script type="text/javascript" src="http://wave-api.appspot.com/public/embed.js"></script><script type="text/javascript">
function initialize() {
var wavePanel = new WavePanel('https://wave.google.com/wave/');
wavePanel.loadWave('googlewave.com!w+Wt7Fj-_RC');
wavePanel.init(document.getElementById('mdhoerr_wave'));
}
</script>
<h3>
	Some Info</h3>
<p>
	Wave API: http://wave-api.appspot.com/public/embed.js</p>
<p>
	Wave URL: https://wave.google.com/wave/</p>
<p>
	Wave ID: googlewave.com!w+Wt7Fj-_RC</p>
<p>
	<button onclick="initialize()">Show the wave</button></p>
<div id="mdhoerr_wave"></div>
