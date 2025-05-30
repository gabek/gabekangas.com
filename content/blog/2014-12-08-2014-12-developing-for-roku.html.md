---
layout: post
title: Developing for Roku
categories:
- Projects
tags:
- roku
- development
status: publish
type: post
published: true
date: 2014-12-08 21:30:00.000000000 +00:00
meta:
  _thumbnail_id: '283'
author:
  name: Gabe Kangas
  website: http://gabekangas
  email: gabek@real-ity.com
  github: https://github.com/gabek
  image: "/images/avatar-64x64.png"
---
```{=html} <iframe src="//player.vimeo.com/video/112659447?wmode=opaque&amp;api=1" width="1280" height="720" frameborder="0" title="The Bat Player" webkitallowfullscreen mozallowfullscreen allowfullscreen> ``` ```{=html} </iframe> ``` Ask yourself, *\"Do I know anybody who\'s developed anything for the Roku Media Player?\"*  More than likely the answer is no.  If you ask others you might get get some response, but more than likely nobody you know has done it either.

And that\'s why I wanted to throw up a little piece about building for the Roku.

**Chapter 1: I want to listen to Streaming Internet Radio.** ------------------------------------------------------------

![ Marantz audio reciever ](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_547e9e8fe4b001b264e4c80e_1417584291798__img.png_) Marantz audio reciever

For me it started innocently enough.  I wanted to listen to streaming internet radio.  I had been listening using my Marantz home theater receiver.  This was ok, I guess.  The interface looked like this:

Not awesome.

My next thought was the AppleTV.  I use my AppleTV for everything else.   The interface is pretty good, but not great.

![ AppleTV ](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_547e9982e4b002e3c07c8e97_1417582978678__img.jpg_) AppleTV

But then I learned of a major deal breaker: You can\'t add your own stations.

So I looked at other options.  Run an iOS app and AirPlay mirror it to the AppleTV?  While that works that\'s not elegant in any stretch of the imagination.  Build an HTPC?  Get a Raspberry Pi?  All valid options.   But then I remembered that Roku had a ton of available content.  Surely it must have what I\'m looking for.  Next thing you know I have a Roku 3 on order.

It turns out I was right.  The Roku had a ton of applications (they call channels) that focused on music and streaming audio.  Here are some of them:

```{=html} <div class="image-gallery-wrapper"> ``` ![](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_547e9b8be4b0ad44dee0991e_1417583500268_32ce35dd8e17415394116be520712e70.png_) ![](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_547e9bcce4b01c4bf3c4d502_1417583569343_cf1cf17c09db42109996bcdda628de6c.png_) ![](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_547e9bf7e4b04e450c947295_1417583607880_f82bed014f5d42ea914cec46992f10b9.png_) ![](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_547e9c2de4b074ac7ca3a3a6_1417583674729_e7f75a707c6d48b99509e33ee5e89beb.png_)

```{=html} </div> ``` With the SHOUTcast Radio application being the only one I could find that I could add my own stations, I was a step further than I was before.  But, as you can see, a lot of Roku apps have a very templated feel to them.  I later learned why this was.

I started thinking of other features I\'d really like.  Last.FM Scrobbling, Adding to Rdio playlists, updating my room lighting with my Philips Hue system.

Chapter 2: Why Don\'t I Just Build My Own?  ------------------------------------------

Before I knew it I was browsing around the Roku Developer portal.   Things I learned right away:

1.  They have an open SDK.  Cool!  2.  You write in a language called BrightScript.  WTF is BrightScript!?  3.  Callbacks and async stuff happens through a \"message port\".  4.  You have to support SD and non-widscreen TVs.  5.  They have an approval process like Apple to get on their channel
    store.

Sounds fair enough.  Let\'s go through this.

But here\'s my disclaimer:  I\'ve developed one Roku channel, and [t](http://forums.roku.com/viewforum.php?f=34)[here are people who know much more about it than I do](http://forums.roku.com/viewforum.php?f=34).  I did about as well as anybody who\'s building something for the first time with a technology would, and I\'m only giving my initial thoughts.

BrightScript is fundamentally a bastardized version of BASIC.  It\'s a language so obscure often a Twitter search for the word will bring up zero results.  Roku\'s SDK provides you a limited set of native objects like Arrays, Associative Arrays, an HTTP client, Bitmaps, etc.  You create one of these objects with a simple syntax of

``` {.source-code} myArray = CreateObject("roArray") ```

Everything starts with **ro** and it\'s weird to create an object by it\'s string name.  But whatever.

But those objects are it.  You can\'t subclass, you can\'t create your own first class citizens, and you are at the mercy of the SDK.  

So without being able to specify custom objects it seems that any Object Oriented approaches are out the window.  Oh no my friend.

This is where your new best friend, the roAssociativeArray comes into play.  You\'ll use it for everything.  And you\'ll use it for this too.

Let\'s say we wanted to build a simple cache class.  We\'d do something like this:

```{=html} <script src="https://gist.github.com/gabek/43502fd2d766f4828702.js"></script> ``` So let\'s go over this.

-   Your \"class\" is really just an associative array.  ( {} is the AA
    shortcut, like in other languages).
-   **m** is a weird magical variable that points to your associative
    array as long as the function was fired via the declaration in your \"class\".  In this case you obviously just can\'t call *\"cache\_add\"* directly, you\'d have to call *YourCacheInstance.Add* in order to get the magical **m**.
-   But *cache\_add *is still completely pubic and accessible and
    totally confusing to people who may be reading your code.   You **shouldn\'t** access it directly, but that doesn\'t mean you can\'t.

Ok, so what\'s this port?  It\'s [roMessagePort](http://sdkdocs.roku.com/display/sdkdoc/roMessagePort).   And it\'s stupid.

Have you ever written a video game using a game engine?  You have the game loop, where every cycle of the loop you can do things like move a sprite, check for collisions, make the blue box turn red\... that kind of thing.  Where in modern application development that kind of thing is abstracted from you this is mostly how Roku applications work.  With one big [event loop.](http://sdkdocs.roku.com/display/sdkdoc/Event+Loops)

So if you have a screen that you expect user interaction with first you create a roMessagePort object, assign it to the **port **of your screen, and then start the loop waiting for something to happen.

Here\'s a simple example:

```{=html} <script src="https://gist.github.com/gabek/80571f455cb769e81f86.js"></script> ``` And yes, you don\'t use double equals for comparison.

*\"But what if you make multiple [roUrlTransfer](http://sdkdocs.roku.com/display/sdkdoc/roUrlTransfer) requests and they start coming through a port.  How do you know what each is connected to!?\" *you\'re currently saying in disgust.  Well our friends at Roku has come with a way to work around that obvious oversight.  They added a [GetIdentity](http://sdkdocs.roku.com/display/sdkdoc/ifUrlTransfer#ifUrlTransfer-GetIdentityasInteger) to its interface so you can compare request data coming in to the original request to see who owns it.  Otherwise you\'ll be saving FancyPhoto.jpg\'s data to a file called importantdata.json.  So you\'ll have to keep the original request data around somewhere while you wait for responses to come in.  (If
it\'s an async request you have to keep an active reference somewhere or it\'ll die in transfer anyway, but that\'s besides the point).

So with the basics of how you work with data out of the way let\'s talk about the UI.

Remember seeing a bunch of screenshots above that all look similar?  Say hello to [roSpringboardScreen](http://sdkdocs.roku.com/display/sdkdoc/roSpringboardScreen).   Just another piece of the SDK.  You pass it some data and it lays it out to look like that.  It\'s easy, it\'s fast, and it gets the job done.  Roku supplies a ton of screens that do this type of thing.   [roParagraphScreen](http://sdkdocs.roku.com/display/sdkdoc/roParagraphScreen), [roPosterScreen](http://sdkdocs.roku.com/display/sdkdoc/roPosterScreen), etc.  The obvious downside is almost every Roku application looks the same.

So I took the approach early on that I wanted to do something different, especially for the \"Now Playing\" screen.  So I jumped at [roImageCanvas](http://sdkdocs.roku.com/display/sdkdoc/roImageCanvas).   It does what it sounds like.  You can put images on the screen wherever you want.

roImageCanvas has a lot of niceties.  A built in HTTP client so you can point to URLs instead of having to download things and handle local files yourself and being able to pass a simple array of things to draw are two of them.  For most things this really should be good enough.   But once I implemented my Now Playing screen with it I found I wanted even more control and flexibility.  This is when things got dark.

Working with Roku\'s [roScreen](http://sdkdocs.roku.com/display/sdkdoc/roScreen) is taking that game loop comparison to the next level because it\'s literally for building games on the Roku.  But there\'s no middle ground between roImageCanvas and roScreen.  If you want to do any kind of dynamic visuals on your screen you\'re giving up doing things Roku\'s easy way.

So let\'s talk about how to do some simple things with roScreen.

1.  Want to move a box across the screen?  There\'s no way to ask an
    object where it\'s location is, so when you draw something to the screen keep note of its coordinates.  Next time the loop hits you increment that number.  Then redraw the object with the new coordinates.
2.  Want to fade something in?  Draw it to the screen as completely
    transparent.  Then much like the previous example, keep incrementing the alpha value at the rate you want until it gets to the alpha you want.

`<span>`{=html}But you better watch out.  Doing things like drawing text and drawing alpha\'ed regions are expensive for the Roku to handle.   Luckily roScreen does double buffering so you don\'t see a flicker while it\'s cranking through all of that heavy work like making words appear.`</span>`{=html}

For example, you\'d want to do this on every loop if you want to do any movement.

```{=html} <script src="https://gist.github.com/gabek/4d2a281cef92c52f40fa.js"></script> ``` But if it\'s static, and you have no reason to keep redrawing the screen, you don\'t have to.

This is when that requirement of supporting SD and non-widescreen displays comes into play.  You have to make sure your UI within this screen lays out properly.  Where if you were using any of the SDK canned screens like roSpringboardScreen all this would happen magically for you.  Even roImageCanvas has support for this kind of thing.

`<span>`{=html}Chapter 3: Testing Your Channel`</span>`{=html} --------------------------------------------------------------

And how do you test on old screens?  Well if you have a Roku 3 it doesn\'t support analog/non-widescreen/SD, so you\'d be like me and purchasing a second Roku, a Roku 2.  After discovering there are major performance differences between the Roku 2 and Roku 3 you\'ll probably also want to purchase a Roku Streaming Stick in order to verify your application on all the hardware.

But after all that hard work you\'ll want others to try it out.  And much like the Apple App Store, having your work publicly available is a source of personal pride.

`<span>`{=html}Unlike Apple, anybody who builds a Roku channel can make it publicly available.  You upload it to the Roku developer portal and they give you a link.  Via that link anybody can install it on their device.  This is great for getting a small group to test all your hard work.`</span>`{=html}

The packaging process is simple.  You zip it up, you upload it to your personal Roku, you type in a password that was generated previously, and you download it from your Roku to upload to their portal.

`<span>`{=html}Chapter 4: Distribute On The Roku Channel Store`</span>`{=html} ------------------------------------------------------------------------------

But just having it available isn\'t enough.  You want it on their Roku Channel Store.  Just like the Apple App Store that\'s where people discover new applications and where you\'ll get the users.  But it\'ll have to get approved first.

With Apple a worst case scenario is about two weeks unless there\'s some special reason they aren\'t approving you.  With Roku, let me put it this way: I uploaded my application on September 11th.  That\'s right, it\'s been **88 days** since I submitted for approval.

I did hear from them once about a month in asking me if I could upload a new version that listened on a different HTTP port number in my code.  I did, and then I never heard from them again.  I email them about once a week asking for an update, but never a response.  This kind of treatment is enough for me to say *\"Screw Roku!\"* and why I\'d probably never build a second application on their platform.

All this on top of the small things you might forget about when building for an obscure platform.  Anything you\'ve built before probably has a drop in analytics library so you can get your Google Analytics or whatever going without any effort.  For me I ended up building a [BrightScript analytics package for Segment.IO](https://github.com/gabek/SegmentIO-Brightscript).  Want other 3rd party features?  Those SDKs they provide aren\'t going to work here.  For me I integrated Rdio, the above Segment analytics, Philips Hue and Last.FM on top of my own custom APIs.

So in closing, I\'m certainly not saying that you shouldn\'t develop for the Roku if you\'re thinking about it.  On the contrary, it\'s a really fun challenge to build using an environment that\'s probably completely different than you\'re used to.  And if it\'s a pure numbers game, there are more Rokus attached to TVs than Nexus Android Players or Fire TV boxes combined by an order of magnitude.  It\'s not even close.  But keep your expectations in check, keep your feature set low, and expect to get creative with the solution you come up with.

Or just wait until you can write for the AppleTV.

 
