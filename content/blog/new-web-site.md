---
title: 'New web site for 2019'
description: 'For the first time in a long time, a new personal home page!  I talk a bit about why, and the tools I used.'
type: post
date: "2019-01-13"
categories:
  - 'blog'
  - 'web site'
tags:
  - 'blog'
  - 'hugo'
  - 'web site'
  - 'featured'
draft: false
cardthumbimage: '/blog/images/new-web-site.jpg' #optional: default solid color if unset
cardheaderimage: '/blog/images/new-web-site.jpg' #optional: default solid color if unset
cardbackground: '#263238' #optional: card background color; only shows when no image specified
images: ["/blog/images/new-web-site.jpg"]
'author':
  name: 'Gabe Kangas'
  website: 'http://gabekangas.com/'
  email: 'gabek@real-ity.com'
  github: 'https://github.com/gabek'
  image: '/images/avatar-64x64.png'
---

If you look back at my recent [2018 Year in Review](/blog/2018/12/my-2018-in-review/) you know I was toying with the idea of updating my web site to use a [static site generator](https://www.staticgen.com/). As you can see, I went through with it. Let me explain a bit of the process, and my rationalization behind it all.

I last did a major refresh of my web site about 6 years ago where I went from self-hosting a Wordpress blog to moving everything over to Squarespace. With that I lost a ton of flexibility, **but also lost a ton of hassle**.

My friend [Bob](http://www.bobbyt.com) has been working on his new site, and we talk about it every once in a while. So a personal web refresh has been on my mind. On top of these conversations I also left Twitter and Facebook, so **having a place to call my own has started to become a little bit more important to me**. I kind of knew what I wanted next time I went about it, even if I had no intention of actually doing this anytime soon.

- I wanted a static site with no backend and no dependancies. Before using Squarespace I was a Wordpress user for years and I never want to go back to that place again. I just want to be able to throw this site anywhere.
- The site should be simple. Something more like what the web used to be like years ago. Some time just after everyone was building pages on Geocities and just before everyone was building stupid Flash sites.
- As little Javascript as possible. Preferably zero Javascript, though I went back on this and did end up adding a couple things that required it.  Too bad you have to use Javascript when writing for the web.
- I wanted a place where I could have a list of my current projects.
- Since I left Facebook and Twitter, I wanted a place to put all the trivial junk I'd normally share through those avenues, but weren't worthy of an entire blog post.
- And it should have a little more of my personality than the standard layouts and templates I've used over the years.

I already have too many projects on my plate in active development, but I figured something small and fun would be to see how difficult it would be to export my Squarespace content and get it into [Hugo](https://gohugo.io/). Since obviously if I couldn't get my data out of there then there wasn't much point in even thinking about putting work in. The first step was to export from Squarespace. They give you a Wordpress "bundle", an XML file with all of your posts and metadata, but that wasn't much use to me. So I did some research and found [ExitWP](https://github.com/thomasf/exitwp), a Python script that converts Wordpress bundles to html files that would work with Hugo. A little tweaking and customizing, and in less than an hour I had a directory of files ready for consumption.

Once I had content I thought I'd test to see if I could render it within a basic Hugo site. And before you know it I was actively working on a new personal home page.

Out of curiosity I hit up the Wayback Machine to look at some old websites of mine. I forgot how fully featured they were. Before Facebook was a daily part of our lives my personal website was **really cool**. It tied into Netflix, iTunes, LastFM, Vimeo, Twitter, Twitpic, and more. I wasn't limited by what Facebook offered me, I just built whatever I wanted.  You can see how each version of my site gets progressively more lame over time.

{{< gallery>}}
<a href="/blog/images/old-website-1.png">
{{< figure src="/blog/images/old-website-1.png" title="My site until 2009" >}}
</a>
<a href="/blog/images/old-website-2.png">
{{< figure src="/blog/images/old-website-2.png" title="2009 - 2013" >}}
</a>
<a href="/blog/images/old-website-3.png">
{{< figure src="/blog/images/old-website-3.png" title="2013 - 2019" >}}
</a>
{{</ gallery>}}

So here we are. A new web site that I _think_ accomplishes all the requirements above. It's not the most advanced, or novel, but if nothing else you can tell it's mine. I own the content, I can move it anywhere, and I'm no longer paying Squarespace. And not to be overlooked, I've now officially changed the background image on my web site **for the first time in 10 years**. Let me know what you think over on [Mastodon](https://mastodon.social/@gabek).
