---
layout: post
title: Code for automatically figuring out the Liturgical Season and changing the
  colour on a website
author: jamesbergin
nid: 467
comments: true
redirect_from: /blog/james-bergin/code-automatically/
created: 1364848816
---
Back in 2006, I started to work on my first Catholic blog (www.beingfrank.co.nz).  As I started to explore Wordpress as a CMS and how the themes work within that platform, I wanted to get the colours of the site to change with the liturgical seasons of the Church - i.e. violet for Lent and Advent, gold for Easter etc.

So, I searched the web trying to find the algorithm that is used to calculate when Easter is, as all the other dates in the calendar basically stem from that.  It turns out that there are multiple versions of this algorithm that have been developed and published over the centuries; Wikipedia has more information (http://en.wikipedia.org/wiki/Computus#Algorithms) if you're interested.

At any rate, the algorithm I ended up using is known as the Meeus/Jones/Butcher algorithm and was originally sourced from Marcos J. Montes (http://www.smart.net/~mmontes/nature1876.html).  According to Marcos and Wikipedia, "the actual origin of this algorithm appears to be by an anonymous correspondent from New York to Nature in 1876."

I have recently updated the code as I refreshed Being Frank for Easter 2013, and thought that I would post it here in case it is of use to other Catholic techies out there for use on their projects.  It doesn't require any updating of tables as it calculates everything from the server date.  The code version I've attached is PHP, but you could easily convert it to other formats I'm sure.

Hope it's of use to someone!  :)
