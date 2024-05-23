---
title: "Today marks four years of Owncast"
description: "May 23rd, 2024 marks the 4th anniversary of the first commit of Owncast"
date: 2024-05-23
draft: false
---

May 23rd, 2024 marks the 4th anniversary of the first commit of Owncast, aptly titled: “WIP”.

## WIP

It was a bit before exactly four years ago when I actually started working on it in earnest, but not that far before. I remember duct taping a proof of concept together, opening my laptop's web port to the public internet, messaging somebody and asking “Could you open this URL in VLC or QuickTime or something?”. Since there was no web interface or player, I just wanted to see if video would play for somebody over the internet. When I was told it worked, I went from asking “I wonder if this is possible” to knowing it was possible. 

## What specifically was happening four years ago?

For fun, I took a look at what the first month of Owncast commits looked like, and I don't remember things moving so fast. At that time, it already:
- Had native support for serving video via S3 compatible providers.
- There were two additional contributors apart from me.
- Chat had a fair bit of functionality.
- Video transcoding was completely customizable.
- It had persistent viewer statistics.
- Documentation existed, including a quickstart guide.
- A build script and Dockerfile allowed for relatively easy building.
- You could customize your page content with Markdown.

Here are some other things that were going on at that time that never made it to where we are now:
- It had native support for serving video via IPFS.
- The web interface was built with Vue + Tailwind.
- Your chat username color was determined by a color hash of your username itself.
- Chat had user avatars.
- Chat showed embeds when links were shared, including images.

## Where I started is not where it's been

It's remarkable how fast things move at first on any kind of project, and then as it starts to take shape it slows down and becomes a bit more methodical. Once the core functionality is built and it “works”, then you have to think about what's next. I suppose Owncast could have stopped right there. But I wanted it to be even easier to use, and more customizable. The more people who started using it, the more feedback I'd get, I started to get a picture of the long-term direction of the project and its features. And that direction is still what we're going from today. I wouldn't blame you if you thought I didn't listen to your suggestions, but I promise that's not true. The specific thing you request might not happen, but the spirit of what you're asking for heavily influences the trajectory of the project, and can turn into something that's useful for a wider user base. 

Four years ago, Owncast to me, was a free and open source, self-hosted live video server. And since people who live stream also often enjoy having chat, it would be useful to bundle in a little optional minimal chat side feature as well. But the focus was always the video. It's funny how much time and attention has gone into web interfaces (three entirely different implementations!) and chat over these years, when that has nothing to do with opening VLC and playing back a video stream. It's still a balancing act to this day, since some people care very, very much about chat, social features, the public directory, and interactivity. Others aren't concerned with those at all.

## What's up?

It's never a good time, but I'm looking at the backend codebase that began four years ago. As with anything that was started very small, and you build on top of it long enough, there's a point where at least some changes need to be made. Primarily because some of the things that are on our roadmap simply aren't possible with how the backend is architected. So while it's a messy undertaking, I think it's a valuable one, and it's happening now, so the really cool stuff can continue to get built after that.

## Thank You

Thank you for the four-year journey. Your patience, your kindness, your contributions, your feedback, your encouragement, your donations, and for sharing your Owncast-powered live streams with me. Every so often I look at a screen full of those streams and I can't believe I had some small part in helping you build them. It continues to mean the world to me that you let me be involved. 

I'm still excited about Owncast every day. I can't say there hasn't been periods of burnout, and doubt. And if I didn't have an opportunity to see you out there using Owncast, maybe some of those periods would have been the end of it. But all of you keep it alive. At the end of the day, Owncast only exists because you use it. Everything else is an implementation detail.

Here's to another four, five, ten years when Owncast will still be a “WIP”.


