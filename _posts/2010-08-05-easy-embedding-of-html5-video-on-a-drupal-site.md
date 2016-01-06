---
layout: post
title: Easy Embedding of HTML5 Video on a Drupal Site
author: Jeff Geerling
nid: 302
comments: true
redirect_from: /blog/oscatholic/easy-embedding-html5-vid/
created: 1281025191
---
<p>For the past year, I&#39;ve watched the HTML5&nbsp;&lt;video&gt; element debate (mostly over video formats/containers) with a great interest&mdash;I abhor having to use Adobe Flash on my sites to embed video, especially since that means many videos don&#39;t work on my Linux workstation (which doesn&#39;t have Flash), or on my iPhone/iPad.</p>
<p>The HTML5 &lt;video&gt; element (and similarly, the less-supported &lt;audio&gt; element) promises to take away the stress of having to have flash players, FLV-encoded video, etc. just to show a viewer a non-static piece of content.</p>
<p>In its simplest form, you can add the following code to embed a video on your page:</p>
<p><code><video src="video-file.m4v"></video></code></p>
<p>On my Drupal sites, I&#39;ve been wanting to be able to simply grab an m4v&nbsp;video exported from iMovie, QuickTime, or straight from my camera, attach it to a post via a filefield, and have it display. In the old days, I would use SWFTools&nbsp;to embed the video using Flash.</p>
<p>I&#39;ve found a solution that, in my opinion, is much more elegant, using the &lt;video&gt; element, with a Flash fallback for Internet Explorer:</p>
<ol>
<li>I set up a filefield with which I can attach an m4v file to a piece of content.</li>
<li>I enabled Custom Formatters (an excellent Drupal module for CCK), and set up a simple formatter for this filefield with the code below:</li>
</ol>
<!--break-->
<p><code><div class="html5-video-player">
  <video controls="controls" preload="none" width="640" height="360">
    <source src="[site-url]/[filefield-filepath]" type='video/mp4; codecs=&quot;avc1.42E01E, mp4a.40.2&quot;'>
    <object width="640" height="384" type="application/x-shockwave-flash" data="[site-url]/sites/all/libraries/flowplayer/flowplayer-3.2.2.swf">
      <param name="movie" value="[site-url]/sites/all/libraries/flowplayer/flowplayer-3.2.2.swf" />
      <param name="allowfullscreen" value="true" />
      <param name="flashvars" value=' &quot;[site-url]/[filefield-filepath]&quot;, &quot;autoPlay&quot;:false, &quot;autoBuffering&quot;:false, &quot;canvas&quot;:{&quot;backgroundColor&quot;:&quot;#000000&quot;}, &quot;scaling&quot;:&quot;fit&quot;}}' />
    </object>
  </video>
  <a href="[site-url]/[filefield-filepath]">Download this video (MP4)</a>
</div></code></p>
<p>Two caveats:</p>
<ol>
<li>FireFox = no-go. This probably deserves a post of its own, because I think the Mozilla people are shooting themselves in the foot on this issue, and might drag down the adoption of the &lt;video&gt; element, but they&#39;re basically not going to support H.264/m4v video. So if you want to support FireFox, you&#39;ll have to recompress your video again and upload it to another filefield&nbsp;as an OGG&nbsp;Video, then make a more advanced PHP custom formatter to add in a link to that filefield.</li>
<li>Internet Explorer versions 8 and below will fall back to Flash. Not ideal, but that&#39;s how it is.</li>
<li>For the video to play across all devices, you have to encode it using the H.264 baseline profile... you can encode with higher settings, but then the iPhone, iPad, or both might not play the video.</li>
</ol>
<p>Luckily, though, including a download link to the video will allow even the most ancient browser the ability to at least download the video for viewing apart from the browser.</p>
<h3>Getting this working in FireFox</h3>
<p>To get FireFox support, you'll need to modify your workflow a bit. For the video filefield, make it a two-value filefield, then set up a new Custom Formatter with the 'Advanced' editor. Use the code below (PHP) for your custom formatter, and name it something like 'Universal HTML5 Video Formatter.' Then attach an M4V file as the first filefield item, and the OGV file as the second. Voila! Every browser back to the good ol' days of IE6 is supported!</p>
<?php
// Define video file locations
$m4v_video = '/' . $element['#node']->field_video_podcast[0]['filepath'];
$ogv_video = '/' . $element['#node']->field_video_podcast[1]['filepath'];

// Print HTML5 video code
print '<div class="html5-video-player">
  <video controls="controls" preload="none" width="640" height="360">
    <source src="' . $m4v_video . '" type="video/mp4" />
    <source src="' . $ogv_video . '" type="video/ogg" />
    <object width="640" height="384" type="application/x-shockwave-flash" data="/sites/all/libraries/flowplayer/flowplayer-3.2.2.swf">
      <param name="movie" value="/sites/all/libraries/flowplayer/flowplayer-3.2.2.swf" />
      <param name="allowfullscreen" value="true" />
      <param name="flashvars" value=\'config={"clip": {"url": "' . $m4v_video . '", "autoPlay":false, "autoBuffering":false, "canvas":{"backgroundColor":"#000000"}, "scaling":"fit"}}\' />
    </object>
  </video>
  Download this video: <a href="' . $m4v_video . '">MP4</a> | <a href="' . $ogv_video . '">OGV</a>
</div>';
?>
<p><strong>Note</strong>: I am using the 'field_video_podcast' field for my nodes - your field name might be different. Also, I used <a href="http://taylanpince.com/blog/posts/oggifier-gui-wrapper-ffmpeg2theora/">Oggifier</a> as a GUI for ffmpeg2theora, though I still maintain it's stupid to have to make two video files just to support FireFox, standards be darned. Especially when FireFox won't accept an .ogv filename with spaces (see my comment below)!</p>
<p><em><a href="http://diveintohtml5.org/video.html">Dive into HTML5 - Video</a></em> - a great source for more info on this topic.</p>
