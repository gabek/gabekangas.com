---
title: 'New web site for 2019'
description: 'For the first time in a long time, a new personal home page!  I talk a bit about why, and the tools I used.'
type: post
date: 2019-01-01 00:00:13.000000000 +00:00
categories:
  - 'blog'
  - 'web site'
tags:
  - 'blog'
  - 'hugo'
  - 'web site'
  - 'featured'

cardthumbimage: '/blog/images/new-web-site.jpg' #optional: default solid color if unset
cardheaderimage: '/blog/images/new-web-site.jpg' #optional: default solid color if unset
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

If you look back at my recent [2018 Year in Review](/blog/2018/12/my-2018-in-review/) you know I was toying with the idea of updating my web site to use a [static site generator](https://www.staticgen.com/). As you can see, I went through with it. Let me explain a bit of the process, the tools, and the rationalization behind it all.

I had no intention of actually doing this anytime soon. But I was curious how difficult it would be to export my Squarespace content and get it into [Hugo](https://gohugo.io/). Since obviously if I couldn't get my data out of there then there wasn't much point in even thinking about it down the road. The first step was to export from Squarespace. They give you a Wordpress "bundle", an XML file with all of your posts and metadata, but that wasn't much use to me. So I did some research and found [ExitWP](https://github.com/thomasf/exitwp), a Python script that converts Wordpress bundles to html files that would work with Hugo. A little tweaking and customizing, and before you know it in an hour I had a directory of files ready for for use in.

Once I had content, I thought I'd see if I could render it within a basic Hugo site. And before you know it I was enumerating all the features I'd want in a completely new personal web site.

- I wanted a static site with no backend and no dependancies. I think Hugo is a great option. Before using Squarespace I was a Wordpress user for years and I never want to go back to that place again. I just want to be able to throw this site anywhere.
- The site should be simple. Not just visually, but something more like what web sites used to be like years ago.
- I wanted a place where I could have a central list of my current projects.
- Since I left Facebook and Twitter, I wanted a place to put all the trivial junk I'd normally share through those avenues, but weren't worthy of an entire blog post.
-
