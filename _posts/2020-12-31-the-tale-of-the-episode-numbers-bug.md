---
layout: post
title:  "The Tale of the Episode Numbers Bug"
date:   2020-12-31 12:30:00 -0700
categories: [website, jekyll, podcast, bugs]
author: mkasberg
comments: true
---

One of the ways I put my talents as a software developer to use for the church
is I maintain the [Catholic Stuff You Should
Know](https://catholicstuffpodcast.com) website. I love reading stories about
interesting bugs other developers have encountered, so I thought I'd share my
own story about a bug I recently fixed on
[catholicstuffpodcast.com](https://catholicstuffpodcast.com).

To understand the bug, it will be helpful to have a little bit of the backstory.
The Catholic Stuff You Should Know website was
[originally](https://web.archive.org/web/20160331001430/http://catholicstuffpodcast.com/)
built with [WordPress](https://wordpress.org/).  In 2016, I migrated the website
off of WordPress and onto [Jekyll](https://jekyllrb.com/) (which is what the
site still uses today). As part of that migration, I added episode numbers to
all of our existing episodes to help keep things organized.

I even still have the simple PHP script I used to pull these episode numbers out
of the audio filenames (which already had them) and add them to the Jekyll
frontmatter for the episode so we could show the episode numbers on the website.
It's a little bit hacky, but it got the job done.

```php
<?php
$postFiles = scandir("./_posts");

foreach($postFiles as $file) {
    if ($file == "." || $file == "..") { continue; }

    $contents = file_get_contents("./_posts/".$file);
    preg_match("/audio: '(\d{1,3})-/", $contents, $matches);
    $number = $matches[1];

    print $number . "\n";

    $contents = str_replace("\ntitle:", "\nnumber: $number\ntitle:", $contents);

    file_put_contents("./_posts/".$file, $contents);
}
```


Recently, one of our listeners notified us that the episode numbers for some of
our episodes from summer 2010 appeared to be incorrect. I took a peek, and sure
enough, the listener was right!

![Misnumbered Catholic Stuff You Should Know
Episodes](/images/CSYSK-misnumbered-episodes.png)

I looked around a little more and compiled this list of our first 24 episodes,
as they appeared on our website.

```
06 Jan 2010 · #1 Stylites
12 Jan 2010 · #2 Indulgences
15 Jan 2010 · #3 Prayer, Contemplation, and Liturgy
20 Jan 2010 · #4 Tetragrammaton
25 Jan 2010 · #5 Le Grande Chartreuse
28 Jan 2010 · #6 Eutrapelia and The Risus Paschalis
03 Feb 2010 · #7 Who Punched Arius?
09 Feb 2010 · #008 Cecchina Cabrini
18 Feb 2010 · #009 Ash Wednesday
25 Feb 2010 · #8 Ethiopian Christianity
03 Mar 2010 · #9 Campion's Brag
11 Mar 2010 · #10 Gregorian Chant
01 Apr 2010 · #11 Tenebrae
09 Apr 2010 · #12 The Holy Sepulcher
16 Apr 2010 · #13 Bona Coniugali
23 Apr 2010 · #14 How to Make a Priest
24 May 2010 · #15 Skellig Michael
01 Jun 2010 · #019 Abstinence
01 Jun 2010 · #018 Schisms
15 Jun 2010 · #16 Quiz Show
14 Sep 2010 · #17 Eros and Agape
21 Sep 2010 · #18 New Translation of the Mass
28 Sep 2010 · #19 When Bad Popes Go Good
05 Oct 2010 · #20 Peter's Bones
```

If you can correctly identify the bug from that list, well done! And if you
can't... Neither could I, initially. I was perplexed -- there's nothing
complicated about the way our episode numbers work. We simply pull them from the
YAML frontmatter for the jekyll blog post. From this initial list I had
compiled, it looked like whatever was assigning episode numbers had somehow
ignored a few episodes in the numbering.

Because this is a Jekyll site, each "episode" is just a "post", which is just a
markdown file in a folder in the repository. I broke out some Unix tools to try
to pin down the problem. As I write this, the most recent episode on our website
is #471. And that matches the number of files in our `_posts` directory.

```
$ ls _posts/*.md | wc -l
471
```

Well, it's good news that our total number of episodes matches the current
episode number. But what the heck is going on then? Knowing that our frontmatter
uses a `number:` key for episode numbers, I tried this:

```
$ cat _posts/*.md | grep "number:" | cut -f 2 -d ' ' | sort -n
001
002
003
...
469
470
471
```

At a glance, that list looks correct. Let's look at all frontmatter "source" for
all the numbers for all episodes from 2010.

```
$ grep "number:" _posts/2010-*
_posts/2010-01-06-stylites.md:number: 001
_posts/2010-01-12-indulgences.md:number: 002
_posts/2010-01-15-prayer-contemplation-and-liturgy.md:number: 003
_posts/2010-01-20-tetragrammaton.md:number: 004
_posts/2010-01-25-le-grande-chartreuse.md:number: 005
_posts/2010-01-28-eutrapelia-and-the-risus-paschalis.md:number: 006
_posts/2010-02-03-who-punched-arius.md:number: 007
_posts/2010-02-09-cecchina-cabrini.md:number: 008
_posts/2010-02-18-ash-wednesday.md:number: 009
_posts/2010-02-25-ethiopian-christianity.md:number: 010
...
```

Everything's apparently correct!

Still confused, I started looking at a specific post in more detail. I started
with February 2010, the first month where broken posts show up. And I noticed
that the "Ethiopian Christianity" episode was showing number 8 on the site but
the frontmatter was number 10:

```yaml
title: 'Ethiopian Christianity'
number: 010
```

Can you spot the bug? Our episode numbers were padded with zeros - a common
practice that makes them sort correctly in filenames. (Remember, I initially
pulled these episode numbers from our audio filenames.) But in this case, Ruby's
YAML parser was interpreting the number as an octal number because of the
leading 0!

```ruby
irb> require 'yaml'
irb> YAML.load("---\nnumber: 010")
=> {"number"=>8}
```

Fortunately for us, this ceases to be a problem after episode 100 (when we no
longer have any leading zeros). So our most recent 371 episodes are numbered
correctly. But some episodes between 1 and 100 have incorrect numbering. In
fact, _most do_. All numbers between 7 and 100 that are valid octal numbers will
be incorrect because only numbers 1-7 have the same representation in octal and
base 10. Some numbers, like `009`, don't parse correctly as an octal number. I
think, in this case, the YAML parser falls back to a string, which is why the
leading zeros showed up on the web for these numbers.

Although the problem was hard to identify, The fix is easy -- we just need to
remove the leading zeros from our YAML!

```shell
sed -i 's/number: [0]*\([1-9]*\)/number: \1/' _posts/*.md
```

So that's how we found and fixed an episode numbering but for the Catholic Stuff
You Should Know website. I hope you enjoyed the story. This wasn't the first bug
I've seen related to parsing octals, and it probably won't be the last! So it's
good to remember this can happen any time you see a leading zero on a number -
particularly number literals in YAML or code. And despite this small bug,
working with Jekyll for the last 4 years has been a pleasure overall.

----

Catholic Stuff You Should Know is a weekly podcast that explores Catholic
topics. Learn more at
[catholicstuffpodcast.com](https://catholicstuffpodcast.com/#about).
