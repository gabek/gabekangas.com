---
title: "Owncasts - A new iOS and tvOS application for viewing Owncast-powered live video streams"
description: "Against all odds, there is now a native iOS and tvOS way for you to watch Owncast-powered live video streams if that is something that appeals to you. See why this application exists, what it is, what it is not, and just a little bit about why Apple sucks."
date: 2024-01-14T09:46:12-08:00
images: ["/blog/images/owncasts-logo.jpeg"]
draft: false
---

## Owncast is server software. That's it

First off, I want to clarify: [Owncast](https://owncast.online) is server software for anybody to run their own, independent, decentralized, completely standalone video streams. It provides some additional features that streamers and their viewers can use, but at its core it's a piece of video server software. That's what I, personally, care about, and that's primarily the value I want the project to offer you. Everything else is secondary.

<center>
<a href="https://apps.apple.com/us/app/owncasts/id6451178968?platform=iphone">
<img src="/blog/images/owncasts-logo.jpeg" width="70%" />
</a>
</center>

## The Owncast Directory

With that out of the way: Early on, mostly as an experiment, I built the [Owncast directory](https://directory.owncast.online). Not because Owncast should in any way be a centralized place to discover live video streams, but as a little side project to display examples of what Owncast is being used for by different people. I figured Owncast is a bit of a new concept, so being able to show how other people are using it might help clarify things. I never treated this as an “official” offering, or some kind of service to rival other services. I treated it like it could go away at any time and Owncast, at its core, wouldn't change one bit. People would still be running their independent live streams without any impact. Because that's how it's supposed to work.

Since then, I've been personally uneasy about having any centralized tools for Owncast streamers or viewers. But, I can't argue that this directory does offer some nice to haves, and I do think people appreciate it. It fulfills a want, even if it's not a need. I guess that's ok. I do have some plans to expand how the directory works so it's less centralized, is powered by ActivityPub, and enables anybody to do their own thing. But that's a topic for another day.

I never intended to expand the Owncast side projects further than that. But time went on, and I listened to viewers, and I saw a wider audience grow. More people who are used to YouTube and Twitch wanting to watch Owncast-powered streams, but wish they had similar tooling to do so.

<center>
<img src="/blog/images/owncasts-ios-browse-live.jpeg" width="30%"/>
<img src="/blog/images/owncasts-ios-browse-offline.jpeg" width="30%"/>
<img src="/blog/images/owncasts-ios-stream-portrait.jpeg" width="30%"/>
</center>

## I want for you something I can't give you

The fact that Owncast, as a project, doesn't have any control over people's servers is essential to me. It's built on standards, so people on any platform, using a multitude of common applications, can watch any Owncast-powered stream. You could even build your own application built specifically for your stream. You don't need me. Likewise, you don't need the directory. Everything already exists for you to do your thing.

I've heard stories of non-technical people refusing to watch an Owncast-powered stream because they like watching on their TVs or phone, and there's no Owncast application they can simply download like they're used to. I've wished streamers could say "Just search the app store for X and press play". But I'm aware nobody is going to go build their own mobile apps.

But I've always wished they did. I've always hoped that every Owncast streamer could have their own native applications to make it super easy for their viewers to watch their streams. I know the open web is super important, but I find native apps to be a really great experience, especially when it comes to media. I want Owncast servers to directly notify their viewers when they go live, and I want a way for people to watch on the TV without having to "cast" (I hate that word so much, this isn't fishing).

I thought about offering templated source code for a native app. Owncast streamers could just fill in the config with their server URL and they'd have their own app. But no matter how much I wish that would happen, I know streamers would never go through the effort to submit their own native app to the app stores. Everyone having their native app experience wasn't going to happen, regardless how much I want it to. And given this is all in the spirit of independence and decentralization, that's about all I can offer in that respect. I can't do it for you.

## I didn't mean to build this for you

Many months ago, due to a handful of personal reasons, I waned to do a little Apple development. I thought it'd be fun to build a little application for the AppleTV to make watching Owncast streams easier for me. And it doesn't take a nuclear scientist in 1945 to know where this story goes from here. Within a couple of days I had built a pretty nice way to watch Owncast-powered streams on iOS and the AppleTV.

I didn't really know where I was going from there, but I found myself adding support for more of the Owncast APIs, many of the features that exist on the web, push notifications, and more.

While the dream of every streamer having their own application wasn't going to be possible, I could supply one application that is built for accessing people's servers, even if they're not publicly listed on the directory. But I'd have to be ok with being a gatekeeper of this single application. And honestly, I'm not really that ok with it. But I can try anyway.

So here we are. A new experimental side project for Owncast viewers on iOS and tvOS. I call it "Owncasts", because it's just a place where you can watch Owncast-powered streams. It's not "Owncast for iOS". Owncast is server software.

If you don't like it, please pretend it doesn't exist. If you don't have Apple hardware, nothing changes for you. If you have an iPhone and don't see the value in this, that's absolutely fine. I'm not judging this by any success criteria, and I don't know what, if anything, is next for it.

<center>
<img src="/blog/images/owncast-tvbrowse-profile.jpeg" width="70%"/>
</center>

## The unfortunate nature of Apple Push Notifications

Unfortunately, if your Owncast server is not listed on the directory, this application will not be able to receive push notifications on behalf of your live stream. In this case it's the directory that sends out the notifications, and if the directory doesn't know about your server, and doesn't know when you go live, then it simply can't be helpful in that regard.

I hate that this is the case. I wish every individual Owncast server could send its own push notifications, but due to how they work that's simply imposable. This is a case where some centralization is required for this feature, and you cannot be 100% private and still take advantage of it. I'm sorry. I feel bad about it.

<center>
<img src="/blog/images/owncasts-ios-apns.jpeg" width="30%"/>
<img src="/blog/images/owncasts-ios-stream-portrait-menu.jpeg" width="30%"/>
</center>

## Decentralized user interfaces

One thing I'd like to see more of is the idea of a single interface of true decentralized content. We're so used to user interfaces of centralized content. Almost every interface displays an array of content that is controlled exclusively by the server who's displaying it. Every stream you see listed on Twitch is controlled by Twitch, every movie you see on Netflix is controlled by Netflix, every image on Instagram is controlled by Instagram.

There aren't many real examples of decentralized interfaces left. An RSS reader is a good example of a single interface full of content pulled in from different places. Or a Podcast client that's downloading Podcasts from different places. Search engines fit this definition on the web. There used to be web directories of content, that's how Yahoo got its start. You click on a link and it brings you to somewhere completely disconnected from the place you came from. That's how the internet is supposed to work! All linked together, but not controlled by any one entity.

This is what the directory has always been, and this is what "Owncasts" is. It's just an interface trying to give you another way to help you consume decentralized content. When you add your own, private, streams to the application, you can almost treat it like a purpose built web browser. You put in an Owncast-powered URL, you can consume that content.

<center>
<img src="/blog/images/owncast-tvbrowse-live.jpeg" width="70%"/>
</center>

## What is this not?

You might be thinking "Cool, lots of Fediverse adjacent projects have iOS apps now!" No.

Mastodon, the company, has an iOS app for their product. Pixelfed, has an iOS app, PeerTube is starting work on an iOS app. **This is not like _any_ of those.**

Those are dedicated focuses, with dedicated developers. Those organizations have those applications on their roadmap and feel they are important to drive their vision forward. Those have Jira boards and meetings and budgets. Those have designers. Those are investments into the future of their products and are important to them.

That's not what this is for Owncast. I don't feel that about this. I don't feel that about the directory, or any of the side projects that are centralized by Owncast as a project, or me as an individual. The only thing that matters is that you have server software to stream with.

<center>
<img src="/blog/images/owncasts-ios-stream-landscape.jpeg" width="70%">
</center>

## The long, long road of rejections

[I posted a couple months ago how I had given up on this project](https://social.gabekangas.com/notice/AatxyxMNMccZlyuXJ2) because Apple found every possible reason to reject it, and I was not making any progress. But I took some time away, and I swapped out my feeling of defeat for defiance and kept at it. One law firm, one conversation with Craig Hockenberry, a series of appeals, and a bunch of creative workarounds later, somehow I made it over the finish line.

I don't want this to be a negative post about how much Apple sucks, but you might be interested in a high level list of a couple of the crazier rejection reasons.

- Apple said I was illegally accessing the Owncast Directory. The same directory the Owncast project itself operates.
- Any Owncast server that had a "Donate" link caused this application to get rejected, because Apple said it was it "collecting money without using in-app purchases".
- It's Apple, so of course there has to be a way to "report" a server, even though that doesn't make much sense in a decentralized world. But if somebody does report one, it'll send me a message. And like usual, if somebody deserves to be removed from the directory they will.
- Apple said I had no rights to show any of the streams listed in the directory in the application. Note they don't care about the _content_ in the streams, just the ownership of the streams themselves.
- Apple at one point rejected the app and said the application shouldn't even exist, because people should use the web version instead. I'm not joking.

<center>
<img src="/blog/images/owncast-tvbrowse-offline.jpeg" width="70%"/>
</center>

## NSFA

Any servers marked as NSFW on the directory get filtered out of the application completely. This should be no surprise. Apple doesn't like bad words or naughty bits.

So if you've set your server as NSFW for no reason, you might want to reevaluate that. Though, of course, you can manually add any Owncast-powered live stream to the app, regardless if it's NSFW or not. So go nuts.

## So, now what?

Like the directory, I don't expect this application to have super active development. Bugs will be fixed, and as new features get added to Owncast they might show up natively in the application as well. We'll have to see.

It's not the most beautiful application in the world, as UI design has never been something I'm terribly good at. But I hope it's functional enough. Maybe that can improve if there are specific things that come up, but I don't anticipate the design of a side project being a focus for anybody.

I thought about adding native chat. But that one addition has so many requirements, and is a large amount of additional work, with the different forms of authentication, and moderation, and text formatting, and handling of custom emoji and all of that. I did experiment with embedding the web chat into the application as a shortcut, but that's a pretty lousy experience. Nobody should be surprised that web in a mobile app sucks. But maybe, one day, I'll put in the substantial work to put in real chat if people cared enough. I think people might like that, but I'm not sure if it'd be enough people. You can let me know, and we can all play it by ear.

You might notice this application is not open source, in the same way the directory is not open source. Why? Because neither of these projects got the attention and the dedication that the Owncast server software gets, and it would be irresponsible for me to say they are an open source project. They are not. You would not be able to build them, and I would not be able to support you if you tried. No documentation, no tests, no support, no even the littlest amount of thinking about anybody building and running it other than me. That's not open source. It's a true side project that I didn't know if I would get approved, or would ever ship.

All this being said, while I don't plan on it, don't be surprised if I accidentally build the Android version some day. But again, this all depends if this kind of thing is useful to people. The Owncast project is not in the business of building mobile applications, but it is in the business of helping people get their live streams out to the world. So if this helps, great. If not, that's ok too.

At the very least this won't be the last conversation around purpose-built applications for viewing Owncast-powered live video streams.

Keep on streamin'. Or viewin'. Or whatever you do, as long as it's cool, keep doing some more of that.

[Owncasts for iOS and tvOS](https://apps.apple.com/us/app/owncasts/id6451178968?platform=iphone)

## Thank yous

[Craig Hockenberry](https://blog.iconfactory.com/author/craig/) from [Icon Factory](https://apps.iconfactory.com/) helped me work around one of the iOS guidelines I was having problems getting approvals with. This application would not have made it through app review without him.

[Yannik Lung](https://yannicklung.com/) did the icon design for the iOS and tvOS applications and I absolutely love how they came out.

The [Sheppard Mullin Law Firm](https://www.sheppardmullin.com/). I wish I was joking.

[Daniel Davis](https://danieldavis.app/) for being my "Apple can suck it, but I'm still doing this anyway" sounding board for many years.
