---
layout: post
title: Building TastemakerX for iOS
categories:
- Projects
tags:
- ios
- tastemakerx
- development
status: publish
type: post
published: true
date: 2013-12-06 19:28:36.000000000 +00:00
meta:
  _thumbnail_id: '268'
author:
  name: Gabe Kangas
  website: http://gabekangas
  email: gabek@real-ity.com
  github: https://github.com/gabek
  image: "/images/avatar-64x64.png"
---
It\'s still in beta, and I\'m still happily iterating over all of the features of the application, but I wanted to share the tools I used, the services I take advantage of, and overall tidbits that might be useful to fellow developers about how I\'ve been building TastemakerX.  Maybe you can in turn share some things with me.

Tools that made my life easier.  -------------------------------

![ Spark Inspector ](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_528be1a7e4b0e9c0c1eb997f_1384899015645_Screen+Shot+2013-11-19+at+2.08.04+PM.png.04+PM.png_) Spark Inspector

### [Spark Inspector](http://sparkinspector.com/)

Both it and Reveal popped up around the same time, but since then I\'ve been using Spark Inspector as a tool to debug view-related things.   We\'ve all done it, make a view\'s background bright green or whatever so it\'ll stand out.  Now I skip that as this allows you to visually troubleshoot, move the frame of views around, change colors\... basic stuff, but very helpful.

We\'ve all had the \"That view is supposed to be right there!\".  So you jump in to 3D mode, see where it actually is, and go from there.

 

### [Cocoa Pods](http://cocoapods.org/)

I was pretty hesitant to jump into Cocoa Pod land.  If you\'re not yet familiar, it\'s a manager for dependancies.  Somewhat akin to a \"package manager\" for Objective-C libraries.  Like gem, or npm, pear in other languages.  I saw it as exchanging Objective-C dependency hell for Ruby dependency hell.  And frankly, I prefer the Objective-C version.  But I experimented with it on some test projects, and saw that I had no issues.  So I made the decision to use it with TastemakerX.   I\'m glad I did.   I do a \"pod update\" after each release, and I know I\'m always up to date.  It also makes experimenting with third party libraries simple.  Add it to your Podfile, \"pod install\", play with it.  If you don\'t like it, remove it from the Podfile and move on.

### [Cocoa JSON Editor](http://www.cocoajsoneditor.com/)

[![ Cocoa JSON Editor ](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_528be3cae4b009fd59304e38_1384899532059_Screen+Shot+2013-11-19+at+2.18.26+PM.png.26+PM.png_)](http://www.cocoajsoneditor.com/) Cocoa JSON Editor

If you\'re building the client, but not the API there\'s often a stage of experimentation.  This is where my experiments took place.  I was able to quickly make requests against the APIs and figure out exactly what it was I was trying to get back.  Not just for our internal API, but third party services as well.

It also really helps the scenario when you need a mocked up API endpoint.  It allows you to create data models, and the built-in web server will map it to a path.  Point your client to it and off you go.   Within seconds you went from a non-existent API to an endpoint with mocked up data.

![ Cocoa JSON Editor ](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_528c2ccde4b04aa0e206fe52_1384918259807_Screen+Shot+2013-11-19+at+7.28.38+PM.png.38+PM.png_) Cocoa JSON Editor [![ Colorbot ](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_528be673e4b018e64a922751_1384900214083_Screen+Shot+2013-11-19+at+2.29.34+PM.png.34+PM.png_)](https://itunes.apple.com/us/app/colorbot/id434493897?mt=12) Colorbot

### [Colorbot](https://itunes.apple.com/us/app/colorbot/id434493897?mt=12)

I kind of wish this was a built in developer tool with Xcode.  While I\'m sure you\'re like me, and have your UIColor+CustomColors category, it\'s really nice to be able to visually organize the color scheme you have for your app.  You use the colors everywhere, so they should be available, definable, and exportable.

So your UIColor category works great in your app, but where do you go when you need that color in your image editor?  Or a CSS file?  Colorbot makes exporting a color easy as a NSColor, UIColor, hex, and more.

 

Third party tools for working with Core Data --------------------------------------------

### [Magical Record](https://github.com/magicalpanda/MagicalRecord)

Both this and mogenerator was suggested to me by a friend.  While I was hesitant to throw a layer on top of Core Data I experimented a bit and saw the advantages.  The big win with Magical Record is simplifying handling Core Data across multiple threads.  You really shouldn\'t be doing any Core Data stuffs on the main thread, so any way to make your life easier here is nice.  It likes using blocks, and so do I, so we became fast friends.  It\'ll give you the managed object context for the current thread you\'re in, and a block to do work in.  The downside?   Documentation.  It\'s kind of all over the place.  Certainly read through the header files.

### [mogenerator](http://rentzsch.github.io/mogenerator/)

A nice little utility that will take your Core Data model and create two class files from it.  One with all the stuff a managed object should have, and one subclass where you get to put all your custom code.  It really does make things more manageable. 

 

External Services -----------------

### [Runscope](http://runscope.com)

Run, don\'t walk, to get yourself an account with Runscope.  At its core, it works as a proxy between you and your API.  Don\'t let that scare you.  Because it\'s the middle man it\'s able to capture, in detail, the activity of your application.  Each request is shareable.   So if in testing you see something weird you can simply log into Runscope, grab the url of that request and share it with whoever may be of interest.  Even if they\'re not a Runscope user.

Other really useful things include bringing attention to all requests that have resulted in an error or requests that took too long to execute. Now with Runscope Radar you can turn a request into an API test template to make sure that thing that was broke stays fixed.  Oh, and it pretty prints the JSON of each request.  Could you do all of this with in-house unit tests, a copy of Charles, and your clipboard?  Sure, but not this good.  It just works.  I wouldn\'t be overestimating if I said it has saved me days of work.  And the same can be probably said for my teammates who I send Runscope URLs to saying \"Could you look at this?\"

[![ Runscope ](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_528bec7be4b0597664381801_1430534964513_Screen+Shot+2013-11-19+at+2.55.21+PM.png.21+PM.png_)](http://runscope.com) Runscope

### [Crashlytics](http://crashlytics.com)

If you\'re like me you\'ve tried a few crash reporting services.  Also if you\'re like me you\'ve kind of been annoyed by all of them in some way or another.  Crashlytics wasn\'t really on my radar until I went to the Twitter mobile dev event a while back.  They gave a demo of Crashlytics and it caught my attention.  It works just like any other crash reporting service, but the difference is it runs a service in the background on your build machine.  This may bother some people, but it\'s nice that it\'s taking care of grabbing the dSYM and keeping track of archived builds without me taking extra steps.  Because of this I\'ve also not had to spend a single second manually symbolicating crash logs that Crashlytics hasn\'t been able to handle or because I forgot to upload the dSYM.

Another nice benefit, It allows you to set arbitrary keys as your user progresses through the application, so I know of things like the last artist id a user viewed, or a chart they were checking out.  Oh, and it\'s free.

![](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_528c3740e4b0c1452600b050_1384920998734_tmxsandbox.PNG_)

Product Development -------------------

When I started at TastemakerX one of the first things we decided was that we\'d be making a rather large change from the idea of the v1 product they had already built.  So we spent some time really knocking out what we wanted this product to be.  During this time I still wanted to be working on some useful code.  So I built some standalone sandbox apps to work out things like networking, image handling, Facebook Open Graph, playlist generation, etc as reusable classes I could seamlessly move over to a production app once we knew what the app would entail.

I know most projects don\'t have the luxury to start working on the application before they start working on the application, but it gave me a nice head start.  Not to mention it enforces solid design patterns when you\'re writing code not knowing how you\'ll be using it later.   There\'s no UI to contaminate your thinking.

 

Some things I\'ve learned -------------------------

I would hope every project I ever work on I\'d learn something new.   This is no exception.  Maybe some of these might jog something you might want to look at.

-   Storyboards are fine.  Use them, or not.  I don\'t care.  This was
    my first non-sideproject storyboard from scratch application I\'ve done and I made the mistake early on to try to \*only\* use the storyboard.  Know when it doesn\'t make sense, and go create your nib files.
-   Don\'t mix up objectWithID, objectRegisteredForID and
    existingObjectWithID.  Just saying.
-   You\'re probably not using NSSet/NSOrderedSet as much as you could
    be.
-   You\'re also probably not using NSCache as much as you could be.  -   Take advantage of iOS 7\'s
    [performFetchWithCompletionHandler](https://developer.apple.com/library/ios/documentation/uikit/reference/UIApplicationDelegate_Protocol/Reference/Reference.html#//apple_ref/occ/intfm/UIApplicationDelegate/application:performFetchWithCompletionHandler:).   You have a background window of time to do some work.  So instead of just fetching new data, maybe also do some of the post-processing you would normally have to do when the UI is up.  Maybe pre-calculate the height of UITableView cells for this data and cache that for later, or if you downloaded some images that need to be resized take care of some of that.  But there\'s only so much you can do in this window, so be smart about it.
-   Speaking of UITableView, check out iOS 7\'s
    [estmatedHeightForRowAtIndexPath](https://developer.apple.com/library/ios/documentation/uikit/reference/UITableViewDelegate_Protocol/Reference/Reference.html#//apple_ref/occ/intfm/UITableViewDelegate/tableView:estimatedHeightForRowAtIndexPath:) if it makes sense for you.  It\'ll postpone the height calculation for a row until it\'s rendered instead of upfront.  This makes more sense on older devices, but on the flipside you might see some frames drop the first time the actual [heightForRowAtIndexPath](https://developer.apple.com/library/ios/documentation/uikit/reference/UITableViewDelegate_Protocol/Reference/Reference.html#//apple_ref/occ/intfm/UITableViewDelegate/tableView:heightForRowAtIndexPath:) is called to calculate the real height when the row is being built.
-   Aside from the audio playback manager, almost every instance of KVO
    I originally implemented eventually got ripped out.  What seems like an elegant solution using KVO is probably just making things over complex.  Think about if that\'s really the solution for the problem.
-   I have all network calls go through a singleton and fire off
    completion blocks.  That\'s worked really well and in retrospect I wish I did the same thing with Core Data.  On the same topic, if I were to go back (and might!) I would never pass back managed objects.  Use Core Data for storage, and build standalone, separate objects out of them.  Each object can have a reference to its Core Data counterpart for CRUD operations.

So that\'s my little rundown on things I found useful or interesting so far with TastemakerX.  I\'d love to hear things that you\'re using to make your life easier or things you wish you would have known when you started as well.  Have fun, mobile friends!

![ Iterate!  ](/squarespace_images/static_50ce21f9e4b0a7200de38642_50d2a1a4e4b0fd42afd19a23_52a22368e4b0866eaca12521_1386357614787_tmxs.png_) Iterate!
