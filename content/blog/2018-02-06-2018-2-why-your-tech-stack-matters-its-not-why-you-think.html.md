---
layout: post
title: Why your tech stack matters (It's not why you think)
description: My thoughts on cross-platform development solutions given the rise in popularity of React Native.
categories: []
tags:
  - development
  - featured
  - ios
  - javascript
status: publish
type: post
published: true
date: 2018-02-06 17:32:39.000000000 +00:00
cardthumbimage: '/blog/images/tech-stack-matters.jpg'
cardheaderimage: '/blog/images/tech-stack-matters.jpg'
meta:
  _thumbnail_id: '298'
author:
  name: Gabe Kangas
  website: http://gabekangas
  email: gabek@real-ity.com
  github: https://github.com/gabek
  image: '/images/avatar-64x64.png'
---
![](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_5a762fc453450ac9093ce48a_1517694953069_What%E2%80%99s_New_in_Swift_-_402-480x253.png_)

Recently I\'ve received a lot of messages from recruiters looking for an iOS developer to build with React Native.  And while I generally don\'t care what technologies people are selecting to build their products, I find this to be a subject that I think warrants a deeper dive.  But a disclaimer up front: I have a bias, and I only speak for me, not for any team I\'m currently or have been a part of.

I\'m going to focus on mobile development in this post, but it\'s as bad, or worse, with the desktop.  Bad [Electron](https://electronjs.org/) apps, written with web technologies, are everywhere, and today [Microsoft announced](https://blogs.windows.com/msedgedev/2018/02/06/welcoming-progressive-web-apps-edge-windows-10/) that web apps are going to be first class citizens next to native apps on the Microsoft Windows store.

My experiences with different mobile development options have been with the best of intentions by the team who selected it.  For example, I\'m currently on a team I think nothing but the best of who have gone the React Native route with a good mixture of actual-native.

What I\'ve released iOS applications with:

1.  Web only (Web view) 2.  Hybrid frameworks ([Phonegap](https://phonegap.com/),
    [Titanium](https://www.appcelerator.com/Titanium/))
3.  Swift 4.  Objective-C 5.  Game engine (C++) 6.  [Xamarin](https://www.xamarin.com/) (C\#) 7.  [React Native](https://facebook.github.io/react-native/)
    (Javascript)

While I won\'t go into the details of each of the above stacks, I would like to use two of these solutions, Xamarin and React Native, as examples to talk about the realities in using them.

Xamarin is a development environment that allows you to write your application in C\# while still using native Apple controls and frameworks.  Business logic, networking, persistence, etc would only be written once.  C\# is a generally well-liked language and has a lot of features.  While very different than Apple\'s languages there\'s nothing you really can\'t do at a language level.

With React Native the view layer additionally is abstracted.  It has its own version of everything and only behind the scenes are the native frameworks and libraries even known about.  Often they\'re not used at all and a replacement React Native specific implementation of what you\'d expect is used instead. You\'d write most things only once for multiple platforms, both from a business logic and UI standpoint.  In general, you\'ll get mixed reactions from the developer community when asking about Javascript.

So let\'s use these two development environments and talk about a fictional new UIKit class that Apple adds to iOS, let\'s call it UITriangleView.

First UITriangleView will be announced at WWDC.  There will be sessions dedicated to it with examples of its usage, details on using it in a performant way with Swift and Objective-C, and where you can go next to read more about it.

UITriangleView will then be available in the iOS betas.  All of the iOS developers will download the new XCode with the new SDK and try it out.  Blog posts will be written about all of the advantages of drawing triangles, and there will be deep dives into the future of triangles on iOS.  Throughout this process the Xamarin and React Native developers are patiently waiting, since neither of these environments know about UITriangleView yet.  Depending on the complexity of this new class, the release timelines of these organizations, and testing, we\'re talking anywhere from weeks to months to get it added to Xamarin or React Native.  And it\'s likely to be buggy when it does since they\'re just learning about it, too.

When looking for documentation you\'ll find a lot from Apple.  It\'s detailed and will get you moving fast.  But you won\'t find this documentation for your non-native implementation.  With React Native you don\'t access the class directly at all, so Apple\'s documentation is useless to you.  With Xamarin hopefully you can translate the usage of the class into C\# yourself, as long it\'s not using any native Apple language features, or you have a different way of doing things in C\#.

Some new really cool 3rd party libraries might be built on top of UITriangleView.  Maybe FUTriangleManager was written in Swift and takes advantage of the new class.  Xamarin and React Native will never know about the APIs in this library so a process known as [bridging](https://facebook.github.io/react-native/docs/native-modules-ios.html) (or [binding](https://developer.xamarin.com/guides/ios/advanced_topics/binding_objective-c/walkthrough/), or linking) must be done where the developer wanting to utilize the library must write code that links the non-native C\# or Javascript to native iOS or Android code.  This process must be done for any library, SDK or 3rd party code that the developer wants to use.  This bridge code must then be
maintained throughout the lifetime of the application and updated each time the 3rd party code is updated.  And given this 3rd party bridge you wrote only works for one platform your dreams of running the same codebase everywhere just fell apart.

All of these, and more, often lead people who use non-native development to hold off on new APIs either because they have to, or it\'s too much of a hassle.  And that\'s ok.  You don\'t need to live on the bleeding edge.  But sometimes it\'s not even about taking advantage of new technologies.  Do you have a partner that needs you to integrate an SDK of 3rd party code for any reason?  And this means **any 3rd party code**.  Analytics, partner SDKs, marketing, etc.  Sometimes a specific version for your environment is available, and sometimes you\'ll be able to bridge it, and sometimes it makes more sense just to write your own implementation of it from scratch so you can try and share it between multiple platforms.  Writing 3rd
party SDKs from scratch probably won\'t fall into your idea of \"easier\" or \"faster\".

**These are what I think of as the hard facts surrounding iOS development.** The technology, the implementation and the actual day to day usage of it.  How much time you spend trying to get it to work by emailing Xamarin and searching React Native\'s Github issues. **But I believe even more important are the soft facts**.

What are the community events like that are held around those technologies?  When recruiting how hard is it to find somebody with experience using your non-native choice?  Are you going to hire native developers and train them when they join?  How happy will they be one year, two years down the road when they\'re left out of all of the exciting new APIs coming out of Apple?  How happy will they be when they go to look for their next position and have to explain that they built using alternative options and haven\'t written using supported Apple technologies in a while?

And, sure, it\'s a little \"touchy-feely\" of me, but as somebody who\'s been a part of the Apple ecosystem for a while I feel like I\'m a part of something.  When something new comes out we all talk about it together.  We have Slack rooms and forums where we post questions, meetups at coffee shops, and events hosted by companies who are using these technologies.  Once a year we show up at WWDC from all over the world.  It\'s a real, tangible thing that you can feel and experience.  It\'s a world you\'re a part of.  It\'s not just a technology choice.  There\'s a passion for the tools used.  Many of the tools and developers with a deep history going back to [NeXT](https://en.wikipedia.org/wiki/NeXT), and I happen to think that\'s pretty cool.

Of course, Javascript people have passion, too.  But you can argue [*they have to*](https://www.quora.com/Why-does-JavaScript-have-so-much-hype-nowadays/answer/Richard-Kenneth-Eng?utm_content=buffer680b5&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer).  And it\'s generally not a passion for devices and apps, it\'s for the web and the DOM.

While the holy grail of \"write once, run anywhere\" may pull you in, it\'s a promise that time and time again rarely comes to fruition, and I\'ve personally seen many instances where it falls flat. Think not just about those hard facts (3rd party integration, new APIs, performance, compatibility, long-term maintenance) but also about the soft (developer happiness, community, recruiting).

Sometimes you just want to build a quick app, and sometimes you want to do and be a part of something bigger.
