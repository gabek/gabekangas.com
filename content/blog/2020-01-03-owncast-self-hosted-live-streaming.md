---
title: 'Owncast: A project to take control over your own live streaming'
description: 'With the explosion of live streaming due to the 2020 COVID-19 Pandemic people are flocking to the large internet service companies.  Maybe there can be an alternative.'
date: 2020-06-04
type: 'post'
categories:
  - 'blog'
tags:
  - 'blog'
  - video
  - streaming
draft: true
cardthumbimage: '/blog/images/2020-01-03-owncast-self-hosted-live-streaming.jpg' #optional: default solid color if unset
cardheaderimage: '/blog/images/2020-01-03-owncast-self-hosted-live-streaming.jpg' #optional: default solid color if unset
cardbackground: '#263238' #optional: card background color; only shows when no image specified
images: ["/blog/images/2020-01-03-owncast-self-hosted-live-streaming.jpg"]
'author':
  name: 'Gabe Kangas'
  website: 'http://gabekangas.com/'
  email: 'gabek@real-ity.com'
  github: 'https://github.com/gabek'
  image: '/images/avatar-64x64.png'
---

### Backstory.

In 2020 the world changed when everyone become stuck in their homes, looking for creative outlets to share their art, skills and themselves from inside their bedroom.

This created an explosion of live streaming on Facebook Live, YouTube, Instagram, and Twitch. These services provided everything they needed, an easy way to live stream to the world, and a chat for users to be a part of their community.

But in a world where many were previously finding ways to rely on the big internet service companies less, the 2020 COVID-19 pandemic made everyone run right back to them.

And as soon as people started streaming their DJ sets, concerts, movie watching parties, and themselves just sitting around listening to music **the big companies came to [mute their audio, disconnect their streams, remove their recordings and ban these users all together.](https://www.youtube.com/watch?v=cX6Xccx17gM)**  [Even if they owned the content](https://www.washingtonpost.com/entertainment/music/copyright-bots-and-classical-musicians-are-fighting-online-the-bots-are-winning/2020/05/20/a11e349c-98ae-11ea-89fd-28fb313d1886_story.html).  These huge corporate entities legally have to shut anybody down at the even slightest hint of a copyright issue, or they put their own company at risk.  Fair use and common sense be damned.

That's when I wanted a better option for people. Something you could run yourself and get all the functionality of these services, where you could live stream to an audience and and allow them to take part in the chat, just like they've been used to on all the other services. But instead of handing control over to somebody else, you run it.  **You won't get shut down, and you own it all, just like it should be.**

I figured you can install Wordpress and self-host your blog, or install Megento and self-host your e-commerce site.  You can install Icecast and have your own internet radio station.  Spin up an instance of Mastodon and you have your own social media site that you control.  You can even install Nextcloud and have your own personal productivity service replacing Dropbox and Google Docs.  There's an open-source alternative to all the big services that you can run for almost everything, but I couldn't think of what the live video streaming equivalent was.  **There should be a independent, standalone _Twitch in a Box_.**

So I set out to look at this and answer the question: **Can I build a self-hosted, open source solution that allows an individual to replace the live stream experience of the big social sites?**


### Current state

**This is a work in progress.**  The web UI is being worked on and functionality is still being tested and iterated on.  Feel free to test if you have some use for it and give feedback, but it's not ready for production.

That being said, I have something that works.  I call it [Owncast](http://owncast.online/).  There's a demo server up at [goth.land](https://goth.land) that I've been streaming random stuff to.  Sometimes I'll get on and stream something live, and sometimes I'll put some pre-recorded video up like a concert, and sometimes I'll just put a song on and show the current time so I can test the stream in relation to live.  Ginger has volunteered to work on the included web page that has the player and chat UI because she's a pro at web layout and design.  So that's all a work in progress.

This is running on a $5/mo Linode server with other stuff running on it.  The video itself is being distributed from AWS S3 and it works well.  Equally well is allowing it to serve the files directly, but I wanted to test if adding an an additional layer muddied things up.

#### What it can do currently

* It takes in a RTMP stream from a user and generates a HLS stream that's embedded in a supplied web page.
* You can read and write to the chat in real-time from this page.
* Can serve video directly from itself.
* Can serve video via an AWS S3 bucket.
* Can serve video via [IPFS](https://ipfs.io).


### Requirements

* An individual can take the existing software they're using and instead of pointing it at a 3rd party, simply point it at their own service.
* It should be a single binary with all the built-in features.  You shouldn't have to run another web server or fight a bunch of dependencies.
* You should have options on where the actual video is distributed from to allow for flexibilty with bandwidth usage and performance.
* There should be complete control over the web page to the person running the stream.  Plain HTML that is editable, or don't use the included web page at all and just link to the video stream directly from elsewhere.
* There should be no accounts, database servers, or excessive state that needs to persist anywhere.


### Things of note

* ffmpeg is the best in class as a video transcoder, so there's no reason to not use it.  So I am.
* Writing in Go allows me to build a single binary that people can download as a release for their platform without any need for dependency management or installing additional things via npm, gems, etc.  It's a great fit for a cross-platform _"download and run"_ mentality. 
* People are used to using [OBS](https://obsproject.com/) as the standard for streaming their content.  This sends a stream via RTMP, so building in a RTMP server allows people to just point OBS at their new server without any other changes.
* I've really enjoyed the [DNA Lounge web chat](https://www.dnalounge.com/webcast/video.html) they built for their live streams where you just type in your name and start chatting.  No accounts, no authorization (for better or worse).  So for now that's the approach I want to take.  It feels like it's from a simpler time, and I like that.


### Concerns and thoughts

* Video is super bandwidth heavy.  It remains to be seen how heavy and what the financial cost for offloading the video to S3 is.  But if you have a host with a high transfer cap, then you're fine and don't need something like S3.
* Transcoding video is super CPU heavy.  But at a single bitrate, on a cheap, low-powered server, it seems to be fine.  It remains to be seen how it'll work when adding support for adaptive bitrates.
* Offering a public chat opens up a whole lot of concerns regarding spam, harassment, etc.  But those are all solved problems.  Moderation can be added.


### Specific solutions

I wanted built-in support for offloading the actual video  to other services.  S3 was an obvious one.  The video origin is the server that's running the software, but the user actually pulls it down from S3 as to limit the amount of bandwidth being used on the local server.  S3 is just where I started, but I plan on testing other S3 compatible services, as there are cheaper options out there than AWS like Wasabi, Backblaze and Linode.  I felt starting with the most popular option made sense.

I also added experimental support for [IPFS](https://ipfs.io), a distributed way of transferring files around.  I thought if the origin server adds the video to the IPFS network then the player, through an IPFS gateway, can download the file, alleviating the need to continue to need to go back to the origin server, just like the above S3 support.  Except in this case IPFS is free, and it's distributed.  But it can also be very slow.  But it works, when it's not slow.  That's why I call this "experimental support".  I really love the idea of it, but more time and research needs to see if it's possible.  But it's supported in Owncast and people can try it out.


### A note about cost

Keep in mind that while streaming to the big social companies is always free, **you pay for it with your identity and your data, as well as the identity and data of every person that tunes in.**  When you self-host anything you'll have to pay with your money instead. But running a self-hosted live stream server can be done for as cheap as $5/mo, and **that's a much better deal than selling your soul to Facebook, Google or Amazon**.


### What's next?

* Since a testable version of functionality exists, I want to keep testing it and finding any gaps.  I particularly want to find any limitations with computing or bandwidth to determine what cases it's just not feasible to run your own streaming server, or if there are more requirements than I'm aware of.  A part of this is also doing a lot of streaming and distributing the video via S3 and looking at the costs.  I want to be able to give people a realistic price estimate if they want to hand off the video to a 3rd party in order to save their own bandwidth.

* The web UI will also get updated so it's actually something you want to look at and use.

* I need to add support for generating multiple bitrates so adaptive switching can be possible.  But that will add additional computing load, so more testing to see if that breaks things is needed.

* I'm far from a Go expert, so as time goes on I'll be making better decisions and refactoring some of the proof of concept experiments into real code.

### Why did I write this post?

For two reasons.  One, so when I'm talking about this project I can point people to a little more detail about it.  And secondly, maybe somebody will read it and be interested in taking part in some capacity.  It lives on [Github](https://github.com/gabek/owncast), so feel free to check things out over there if you have interest in the subject, the project, writing some Go, or learning more about HLS video.