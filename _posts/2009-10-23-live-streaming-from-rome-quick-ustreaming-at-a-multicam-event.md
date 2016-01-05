---
layout: post
title: Live Streaming from Rome - Quick Ustreaming at a Multicam Event
author: Jeff Geerling
nid: 142
redirect_from:
  - /blog/oscatholic/live-streaming-rome-quick-ustreami/
created: 1256287437
---
<p>For the past week (and the next), <a href="http://www.lifeisaprayer.com/special-sections/roma">I've been in the Eternal City</a>, helping the Redemptorist community stream their 24th General Chapter. They wanted to share the proceedings in a more immediate fashion with the broader Redemptorist community around the world, and this is probably the best way to do it.</p>
<p>A few months ago, I was approached by the Redemptorists' communications director and asked what kind of equipment he would need to take a live video feed from a multi-camera setup, and broadcast it on Ustream (free streaming = a good solution - you can also use Watershed or a similar paid service if you need it).</p>
<p class="rtecenter"><img src="/sites/opensourcecatholic.com/files/user-uploads/oscatholic/quick-and-dirty-ustream-multicam-setup.jpg" alt="Ustream - PC Solution - DV Bridge" width="525" height="394" style="display: block; margin-left: auto; margin-right: auto;" /></p>
<p>I found a great little Analog-to-Digital converter from Canopus, the ADVC-55, and also purchased the ADVC-PSU5V AC Adaptor Kit with it (since the PC laptop the Redemptorists have has only a 4-pin/no-power FireWire port. I've used a variety of DV bridges in the past, and always had trouble with keeping a reliable DV stream into the computer. Luckily, the Canopus does a great job, and has not once caused a blip in the DV stream - it takes composite video in (along with audio, if need be), and converts it to a DV stream over firewire.</p>
<p>I didn't even have to install a driver on the Vista PC, as the DV stream acts as a generic DV-over-FireWire stream. Therefore, Ustream immediately recognized it and put it online.</p>
<p>For audio, we are using an output from the sound mixer, converted from XLR to 1/4" stereo minijack, and it sounds pretty good. You can easily control the volume of the signal either (a) at the board itself, or (b) using Ustream's volume slider. Note, however, that you should listen to the stream so you can see whether or not the sound is clipping. If it's clipping, you may need to use a different signal, or change the input on your computer from mic to line level.</p>
<p>This kind of setup works great for those who have in-house video systems, as it is probably the easiest way to convert analog video (composite, RCA-jack video, or S-video) into a usable source for Ustream, Watershed, and the like.</p>
<h3>More on streaming via Ustream</h3>
<ul>
<li><a href="http://www.lifeisaprayer.com/articles/computing/2010/how-stream-tricaster-broadcast">How to stream from TriCaster Broadcast/Pro to Ustream.tv or Watershed</a></li>
<li><a href="/blog/archstl/how-archstl-streamed-inst">How @archstl Streamed the Installation Mass Video Online and via Satellite</a></li>
<li><a href="/wiki/117/live-streaming-event">Live Streaming from an Event using Ustream or Watershed</a></li>
</ul>
<p>Any other suggestions?</p>
