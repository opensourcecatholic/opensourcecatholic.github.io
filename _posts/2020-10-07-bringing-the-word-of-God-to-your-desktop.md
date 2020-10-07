---
layout: post
title:  "Bringing the Word of God to the desktop and to websites"
date:   2020-10-07 14:35:00 +0200
categories: [bible, api, plugins]
author: johnrdorazio
comments: true
---

# Bringing the Word of God to the desktop and to websites

There are a number of projects out there that publish Bible texts online. You can look up Bible verses, and even compare between versions. 

That's great for just consulting a Bible verse. But what if you want to quote a Bible verse in a document, or on a website? 

Most people would go to one of the websites where you can find an online version of the Bible, copy the verses they are interested in, and paste them into their document (or webpage).
But then you probably have to reformat the text, and depending how long it is, it can become a cumbersome task. You might mistakenly delete or alter a word in the Bible quote.
If you're not careful about which website you're consulting, you might not even be getting an authentic source of the Bible text. 
Maybe you don't even know what version of the Bible you're copying and pasting from, if you're not careful and informed in Bible studies.

A few years ago, a priest in a parish I was in showed me a Macro for Microsoft Word, which could retrieve a Bible quote from BibleWorks, if BibleWorks was installed on the computer.
That was a great little tool. However, it was not officialy published anywhere, it was just some little tool someone had made and passed around.
And BibleWorks is not free software, not everyone can afford to have this kind of software. And back at the time, there weren't any Catholic versions of the Bible in BibleWorks.
I tried contacting the developers at some point to ask why that would be the case, and they answered that they hadn't been able to gain the rights for usage of the Catholic versions of the Bible.

So I started developing the idea, why not make a tool that is a little bit more official. A tool that can be published, that people can download and use from official sources. 
And I thought, even though having Bible versions locally in order to work offline can guarantee usage in all cases, it is however a challenge to prevent the Bible texts from being fully copied and published without consent of the rightful copyright owners.
And, it can be a challenge to protect the sources of the Bible texts from being modified or overwritten.

So I thought about the idea of creating an API, an endpoint which can be interrogated by an application, and receive in response the text of the Bible verse or verses from the desired version or versions of the Bible.
APIs are becoming a thing today, so it seemed fit to develop using modern technologies. And producing data from an endpoint in a format such as XML or better yet JSON can guarantee the possibility of consuming the data from any application.

So I set out creating the BibleGet endpoint which can now be found at https://query.bibleget.io . The website that presents the project can be found at https://www.bibleget.io .

And I set out to create a few plugins, to demonstrate in practice the consumption of the endpoint by an application. With patience and constance and a little bit of help from some friends for a heads up here and there,
I was able to produce the following plugins:

* BibleGet plugin for OpenOffice
* BibleGet plugin for LibreOffice
* BibleGet plugin for Microsoft Word
* BibleGet plugin for Google Docs
* BibleGet plugin for WordPress

Haven't recently started a mediawiki installation (https://seminaverbi.bibleget.io), I have started somewhat of an integration into the mediawiki software, however it's just a first attempt. Even though it's in a working state, more progress is required to turn it into a stable and installable extension.

I believe these are all in a functioning state. I have received a few positive feedbacks, I've fixed a couple bugs which prevented one plugin or another from working on my system or another.
Unfortunately many people will download and maybe even use the plugins without giving any feedback, so a little bit of a sense of uncertainty is always there...
I would be glad if anyone in the OpenSourceCatholic community could try out the plugins and give their feedback!

Of course the API endpoint and the plugins are also a work in progress, and it can be a lot of work seeing that programming is not my main occupation.
Being a Catholic priest, I have other duties. 
However programming is a passion, I enjoy doing it, I enjoy problem solving and it can be satisfying to see the result and to receive encouragement from people who find these tools useful.
Perhaps in a next post I can outline some of the problems I am currently trying to solve, in order to enhance some of these projects.
