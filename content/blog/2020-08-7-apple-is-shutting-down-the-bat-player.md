---
title: "Apple Has Shut Down The Bat Player"
date: 2020-08-07T09:41:48-07:00
draft: false
type: 'post'
categories:
  - 'blog'
  - projects
tags:
  - 'blog'
  - the bat player
  - internet radio
  - apple
cardthumbimage: '/blog/images/thebatplayer.jpg' #optional: default solid color if unset
cardheaderimage: '/blog/images/thebatplayer.jpg' #optional: default solid color if unset
cardbackground: '#263238' #optional: card background color; only shows when no image specified
images: ["/blog/images/thebatplayer.jpg"]
'author':
  name: 'Gabe Kangas'
  website: 'http://gabekangas.com/'
  email: 'gabek@real-ity.com'
  github: 'https://github.com/gabek'
  image: '/images/avatar-64x64.png'
---

Today [The Bat Player on AppleTV](https://apps.apple.com/us/app/the-bat-player-radio/id1050517930) was shut down.  I wanted to document a bit about the history of the application, and why it's being rejected from the Apple AppStore.

I started The Bat Player in 2014.  I wanted a better Internet Radio experience on the TV.  I dreamt of artist info, album details and photos.  At the time most Internet Radio apps [just showed text of the currently playing track](/blog/2014/12/developing-for-roku/) and I wanted more.

I originally built The Bat Player for Roku, because that was the only set top box that had an SDK that I could build something on.  And in July of 2015, [The Bat Player launched for Roku](/blog/2015/07/launching-the-bat-player-on-the-roku-store-and-its-aftermath/).  But what I really wanted was to build for AppleTV.  I really liked developing on Apple products but unfortunately at the time people weren't permitted to build things for the AppleTV.  Luckily that changed and I went all-in on tvOS as soon as I could.

The first AppleTV build of The Bat Player was submitted to Apple on Oct 20, 2015.  Right when the new AppleTV with tvOS apps were allowed.

#### The 2020 update of The Bat Player

The Bat Player uses a backend service I built called "The Bat Server" who takes a station and returns back rich metadata about the song, album, artist, etc.  It's what powers the Now Playing screen of the app as well as handling search, and the directory.  It's a Nodejs service that's been quietly humming along giving The Bat Player it's unique features.  Fast forward to 2020 and my hosting provider said it's no longer going to support long-running services and instead are focusing on JAMStack and "serverless" infrastructures.  I thought _"Cool, The Bat Server is a great example of something that would work well as discrete API endpoint functions"_ and I went down the road of reworking the backend to fit the "[serverless](https://vercel.com/docs/v2/serverless-functions/introduction)" paradigm.  It required a few client changes to make different requests than it used to, but not anything huge.  A simple update to the client would resolve that.

But it's been a bit since I've made an update to The Bat Player, and it was time to give it some visual refresh, update some of the client architecture behind it, and make it even easier to use.  So I simplified a lot of the code, using new features in iOS and Swift that didn't exist before.  I completely rewrote almost all of the UI in the app.  I also added a new feature where if a station didn't have an image, previously I'd do a Google Image Search in order to try to find the station image, now I generate a unique logo just for that station using a combination of images, fonts and colors.  I'm really thankful to [Ginger](https://github.com/gingervitis) who designed the different images used to compile these dynamic station logos.  They look super cool and I think people were really going to like them.

So with both backend and frontend updates ready I submitted version 1.3.0 of The Bat Player to Apple on July 16th, knowing that on August 7th the old backend would get turned off.

#### The rejection

> Your app contains content or features that may violate the rights of one or more third parties. Specifically, your app provides potentially unauthorized access to third-party audio or video streaming, catalogs, and discovery services.
> 
> Your app and its contents should not infringe upon the rights of another party. In the event your app infringes another party’s rights, you are responsible for any liability to Apple because of a claim.

They said I am out of compliance with App Store Review Guideline 5.2.3.  We went back and forth over messages until they scheduled a phone call.  It was clear on this call they were treating The Bat Player, an internet radio client playing public internet radio stations, the same as if I was submitting an app that was stealing proprietary TV content.  I think they're so knee deep in the TV world right now that they can't see it any different, they even kept calling internet radio stations "channels", approaching it as I'm stealing somebody's private media stream.

They said in order to proceed **I need to provide legal documentation from every station** stating I do indeed have rights to their content.  I tried to explain that the point of Internet Radio is not to have propriety applications for each station, and instead **stations rely on apps like The Bat Player to play their audio streams**, that's the point of it.  I used iTunes, Quicktime and Winamp as examples of applications that play Internet Radio.  I pointed to the many applications that already exist on the AppStore that play this same content.  I tried to state how Internet Radio clients are more like web browsers, where they exist only to consume and render the content that lives online for users.  A web browser doesn't need to show that it has permission to view every web site that exists.  The reviewer only said "I can't speak to other apps".  I said how I tie into a publicly accessible database of stations that exist for discovery purposes, and I would need to provide over 25,000 pieces of legal documentation.  The reviewer on the phone simply said _"I'm sure most of these channels are being run by the same company, so **you can get many taken care of by contacting their parent organizations**."_  It showed that not only did they not understand how internet radio is often a hobby by somebody running something from their basement, **it showed that they couldn't even fathom that the open internet, where individuals do things because they love it, and where content lives independently from applications that consume it.**  They're thinking simply "if people want to watch CBS then they download the CBS app, you can't be putting CBS in your app.  That's stealing."

Once you get rejected and you're run out of options with the reviewer you have to [contact the App Review Appeals Board](https://www.cnbc.com/2019/06/21/how-apples-app-review-process-for-the-app-store-works.html).  And I sent the following final appeal:

> Hello,
>
> The Bat Player is an internet radio client, built to play publicly accessible internet radio streams.  It is not scraping, hijacking, or stealing any content.  It is more akin to a web browser that consumes web pages than something aggregating and playing proprietary video feeds, for example.
> 
> I take advantage of a publicly accessible directory of internet radio stations called "radio-browser" who states in their FAQ:
> 
>> "It is completely free. Free as in Beer/chocolate"
> http://www.radio-browser.info/gui/#!/faq
> 
>
> Internet radio is made to be played with different clients.  It's not like TV providers where each station has their own app and is only designed to exclusively be played in that app.  Internet radio is to be played in iTunes, Quicktime, Winamp, or any of the below applications that are already on the AppStore who are using the radio-browser's dataset API and playing the stations:
> 
> * Cute Radio: https://apps.apple.com/de/app/cuterdio-internet-radio-app/id1489513385
> * Triode Radio: https://apps.apple.com/us/app/triode/id1446513724
> * InstaRadio: https://apps.apple.com/us/app/instaradio-radio-player/id538537206
> * Radio Volume Booster: https://apps.apple.com/us/app/id887768699
> * Frog Radio: https://apps.apple.com/us/app/frogradio/id1442306286
> * Tune Hunter: https://apps.apple.com/at/app/tune-hunter/id1440690657
> * 432 Player Radio: https://apps.apple.com/us/app/432-player-radio/id1479883396
> 
> I urge you to re-evaluate, as The Bat Player being pulled from the AppStore is a detriment to the open world of internet radio as well as to the tvOS ecosystem, something I, and The Bat Player, have been a part of since the launch of the tvOS SDK.

Today is the day the backend shut down and the application is no longer functioning.  Apple isn't replying.  I could rebuild the old backend somewhere else and point the DNS records to it so the current client will hold on a little longer, but when you're in a place where you're no longer able to update or improve your application, that's generally the end of the road.  While the application hasn't yet been pulled from the App Store, they've made it clear it's no longer allowed to be there and it's only a matter of time.

On this last day of The Bat Player it sits on the tvOS AppStore with hundreds of active users.  I hope they've enjoyed the time spent with the app, and that it helped them discover some new music via the on-screen data it surfaced.  I'm sorry it can't continue and they never got the updates.

<iframe src="https://player.vimeo.com/video/174542936" width="640" height="360" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>