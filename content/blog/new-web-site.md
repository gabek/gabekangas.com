---
title: 'New web site'
description: 'For the first time in a long time, a new web site!'
type: post
date: 2018-12-30 20:53:13.000000000 +00:00
categories:
  - 'blog'
  - 'web site'
tags:
  - 'blog'
  - 'hugo'
  - 'web site'

cardthumbimage: '/images/default.jpg' #optional: default solid color if unset
cardheaderimage: '/images/default.jpg' #optional: default solid color if unset
cardbackground: '#263238' #optional: card background color; only shows when no image specified
#cardtitlecolor: "#fafafa" #optional: can be changed to make text visible over card image
'author':
  name: 'Gabe Kangas'
  website: 'http://gabekangas.com/'
  email: 'gabek@real-ity.com'
  github: 'https://github.com/gabek'
  image: '/images/avatar-64x64.png'
---

I accidentally rebuilt my website. Let me tell you the story.

If you look back at my recent [2018 Year in Review](/blog/2018/12/my-2018-in-review/) you know I was toying with the idea of updating my web site to use a [static site generator](https://www.staticgen.com/).

I had no intention of actually doing this anytime soon. But I was curious how difficult it would be to export my Squarespace content. Since obviously if I couldn't get my data out of there then there wasn't much point in even thinking about it down the road. The first step was to export from Squarespace. They give you a Wordpress "bundle", an XML file with all of your posts and metadata.

However a bundle made for Wordpress wasn't much use to me, so I did some research and found [ExitWP](https://github.com/thomasf/exitwp), a Python script that converts Wordpress bundles to html files that would work with Hugo. A little tweaking and customizing, and before you know it in an hour I had a directory of files ready for for use in.
