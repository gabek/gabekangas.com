---
title: 'Some recent projects for my DJ mix hobby'
description: 'I picked up a hobby of streaming and sharing DJ mixes.  Here is some tooling I built to simplify and add functionality to some of that.'
date: '2020-05-13'
type: 'post'
categories:
  - 'blog'
  - dj mixes
tags:
  - 'blog'
  - mixes
draft: false
cardthumbimage: '/blog/images/2020-05-13-a-couple-dj-projects.jpg' #optional: default solid color if unset
cardheaderimage: '/blog/images/2020-05-13-a-couple-dj-projects.jpg' #optional: default solid color if unset
cardbackground: '#263238' #optional: card background color; only shows when no image specified
images: ["/blog/images/2020-05-13-a-couple-dj-projects.jpg"]
'author':
  name: 'Gabe Kangas'
  website: 'http://gabekangas.com/'
  email: 'gabek@real-ity.com'
  github: 'https://github.com/gabek'
  image: '/images/avatar-64x64.png'
---
While the lockdowns have been going on, and I haven't been working (I'll probably blog about that soon), I've been keeping busy with other projects.

I've picked up a new hobby of [doing some DJ mixes](/mixes/), streaming them on internet radio, and recording them for sharing with friends.  This has led me to building some tooling around all of this stuff that I think, for a small population, might find useful.

* [Supbox](https://github.com/gabek/supbox): A tool to get the currently playing track from [Rekordbox v6](https://rekordbox.com/en/).

* [json-scrobbler](https://github.com/gabek/json-scrobbler): Monitor a JSON file with track data in it, and scrobble the track to [Last.FM](https://www.last.fm/) when it changes.

* [Markcast](https://github.com/gabek/markcast): Turn a directory of MP3 files into Markdown files, using the ID3 information.

### Some info about each

#### [Supbox](https://github.com/gabek/supbox)

I've done a couple live mixes on [The Bat Station](/project/the-bat-station/) and I like the idea of being able to share the metadata of the currently playing track.  With the DJ software I use, Pioneer's [Rekordbox](https://rekordbox.com/en/), there's no way to do that.  So I built a tool that can detect tracks and write the metadata to files so other things can do things with it.  Specifically I built it in for use with Rogue Ameba's [Audio Hijack](https://rogueamoeba.com/audiohijack/), the tool I use for streaming to The Bat Station.  But I also added support for [OBS](https://obsproject.com/) because it's so huge with live video streaming these days due to the lockdown.  It can also just write to a generic JSON file so any other tool can take that data and run with it.

#### [json-scrobbler](https://github.com/gabek/json-scrobbler)

Speaking of another tool taking that JSON file and running with it, this tool simply monitors a JSON file of track information and then scrobbles the track to [Last.FM](https://www.last.fm/) so you can share what you're listening to and keep aggregate listening stats.  I made it to work as a companion to Supbox so I can scrobble while I play music in Rekordbox.

#### [Markcast](https://github.com/gabek/markcast)

I built this to simplify distributing recordings I make.  Ultimately in the form of blog posts and Podcasts.  I use a [Static Site Generator](https://www.staticgen.com/) (specifically [Hugo](https://gohugo.io/)) to generate this web site.  It takes a bunch of Markdown files and builds a web site out of it.  It also renders a RSS feed.  So I thought I'd use that as a jumping off point to add a [section of my site for mixes](/mixes/) I'm doing while in lockdown, as well as generate a [RSS feed](/mixes/index.xml) that people can use to subscribe to this as a Podcast.

So it goes through each MP3 file, reads the ID3 information, and creates Markdown files that include a blurb of text extracted from the `commend` tag, the image, and sets the `genre` as a tag in the post.  It also embeds a link to the audio in an `audio` html tag so you can just play it directly.

Also, as a bonus if you're a Rekordbox user, if you save and record your sets using that software, Markcast will use the accompanying _cue_ file and add a playlist and approximate time to the post you generate.

**[Check out some examples](/mixes/)** by clicking on one of the mix titles.

<center>
  <img src="/blog/images/2020-05-13-a-couple-dj-projects.jpg" width=60%>
</center>
