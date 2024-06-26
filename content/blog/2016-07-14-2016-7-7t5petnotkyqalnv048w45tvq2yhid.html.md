---
layout: post
title: Why I love developing for the Apple TV
categories: []
tags:
- appletv
- the bat player
status: publish
type: post
published: true
date: 2016-07-14 15:37:41.000000000 +00:00
meta: {}
author:
  name: Gabe Kangas
  website: http://gabekangas
  email: gabek@real-ity.com
  github: https://github.com/gabek
  image: "/images/avatar-64x64.png"
---
`<!--?xml version="1.0" encoding="UTF-8" standalone="no"?-->`{=html}

tvOS isn't getting the credit it deserves. I\'ve found Apple TV the platform that I've had the most fun developing for in a long time.

The television is the physically largest canvas currently available.   What has been a central point of the living room has historically been the most difficult thing to break into.  The number of people willing to build awkwardly horrible "Samsung apps", for example, are very few.   Even the Roku, previously the most accessible developer platform, has a very small developer footprint. [ I wrote about developing for Roku previously](http://gabekangas.com/blog/2014/12/developing-for-roku).   Having the power, flexibility and ubiquity of UIKit allowing you to turn this canvas into anything you can imagine is really very gratifying.

But just being able to build for the big screen alone isn\'t why I enjoy developing for the Apple TV.  There are real things that make tvOS apps better than their mobile counterparts.

As a developer, how many times have you sat with your designer talking about the tap target sizes of UI elements in your iOS application?  I'll venture to guess it's more than you'd like.  But this isn't a problem with tvOS' Focus Engine.  Anything that's selectable is made obvious via the elements as you explore each screen with your remote.  It doesn't matter how small the element is, with the Focus Engine it'll jump out at you.  The defaults with UIKit elements literally make these items larger when selected, and with UICollectionView, you can directly manipulate them via remote gestures.  This is even better than direct manipulation on a phone or tablet surface where your figures cover up the element you're interacting with.

[![ Image courtesy of https://medium.com/\@flarup/designing-for-the-apple-tv-5992c3aab1e4\#.71q02v28u ](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_57866828d2b857c40a675299_1468426382498__img.gif_)](https://medium.com/@flarup/designing-for-the-apple-tv-5992c3aab1e4#.71q02v28u) Image courtesy of https://medium.com/\@flarup/designing-for-the-apple-tv-5992c3aab1e4\#.71q02v28u

I\'ll be the first to admit the navigation paradigms of iOS applications have a lot to be desired.  It really does cause cognitive overhead for a user as sometimes screens "come from the side" in a Navigation Controller stack, but others "come from the bottom" as a presented modal.  And then there's nav stacks within modals and gestures with custom transitions all adding a whole other level of what seems like no rhyme or reason to the user.  This has been simplified with tvOS.  If you navigate to a new screen, regardless of how the developer is presenting it, there is no difference in the appearance.  Pushing to the stack looks the same as if you're presenting a view controller.  And what's best, the **Menu** button always brings you
back to where you came from, regardless of how you got there.  The developer may be forking you off in any number of navigation trees, but the user doesn't have to know or care about it.  You can save those discussions about your overly complex navigation architecture and go get a nice coffee with this time instead.

Of course there are exceptions to everything I\'ve stated.  You could easily create custom focused appearances that makes something hard to find, or any number of crazy navigation schemes.  But the point is that tvOS was built for simplicity.  Sure, every mobile app developer will tell you they\'re trying to get you to the most important thing in the least number of taps possible, but it\'s obvious that\'s only partially true.  iOS applications don\'t usually adhere to the \"If it\'s not important, leave it out\" category.  tvOS apps (at least currently) do.   Content is the priority, not share sheets, find friends and \"OMG Rate Me on the Appztore Plz\" popups.

I\'ve only had the privilege of building one application for The Apple TV, the same one I built for Roku, [The Bat Player](http://thebatplayer.fm), and it\'s been a fantastic experience.   I encourage you if you have an idea that works for the big screen to build it.  Especially applications, since there\'s currently a ton of games, but not a lot else.

Feel free to reach out if you\'re building something cool for the Apple TV, I\'d love to hear about it.

```{=html} <iframe src="https://player.vimeo.com/video/174542936?wmode=opaque&amp;api=1" width="640" height="360" frameborder="0" title="The Bat Player for AppleTV" webkitallowfullscreen mozallowfullscreen allowfullscreen> ``` ```{=html} </iframe> ```
