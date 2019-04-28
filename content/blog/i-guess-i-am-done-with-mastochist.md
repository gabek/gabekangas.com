---
title: "I'm discontinuing work on Mastochist for Mastodon"
description: 'I spent a whole lot of time building something, so let me explain why I will not be releasing it.'
date: '2019-04-27'
type: 'post'
categories:
  - 'blog'
tags:
  - 'mastodon'
  - 'software'
  - 'development'
  - 'projects'
draft: false
cardthumbimage: '/blog/images/mastochist.png' #optional: default solid color if unset
cardheaderimage: '/blog/images/mastochist.png' #optional: default solid color if unset
cardbackground: '#263238' #optional: card background color; only shows when no image specified
images: ['/blog/images/mastochist.png']
'author':
  name: 'Gabe Kangas'
  website: 'http://gabekangas.com/'
  email: 'gabek@real-ity.com'
  github: 'https://github.com/gabek'
  image: '/images/avatar-64x64.png'
---

<img src='/blog/images/mastochist.png' width="30%">

**I'm no longer going to continue work on my Mastodon client, Mastochist.**  And even though it doesn't really impact anybody but myself, I felt I owed people a detailed explanation and apology since people have heard me talk about the work I've put in it for quite a while.

Mostly I owe an apology to [Cara](https://mastodon.social/@carami) who I hired to design the look of the app, and she became my sounding board as I built out features.  She did a fantastic job and was a huge help.  You should hire her next time you need something designed.

So after months and months of being heads down, working on something I thought was pretty cool, I'm going to stop working on it and not release it.  Why?

The reasons are ultimately a mix of product reasons, and personal reasons, with even a little political reasoning thrown in for good measure.  Let me break down all the things that come to mind when I think of building this client for Mastodon.

------

#### I thought I'd be really into the Fediverse by now, just like I was with Twitter in its early days.

Selfishly, I built this client for myself because I wanted something great.  And comparatively Mastochist is pretty great, but my relationship with the Fediverse didn't grow as I expected it to.  Maybe I was overly optimistic.

In the early days of Twitter I met so many friends.  We discovered each other online, met in person via Tweetups, and it made for life-long friendships.

I don't talk to many people on the Fediverse.  I still don't feel at home there, and I'm certainly not the person who should be making choices for a client used by people who do.  There are probably better people for that.  I'm not a pansexual furry enby posting "lewds".  I'm just a guy with a Mac striking out when I see if anybody is posting about topics that I like.  I'll often think about music I don't understand like Beyonce or Lil Rapstar or whatever and realize I don't enjoy it because it wasn't made for me.  And maybe that's the Fediverse, maybe it wasn't made for me, and that's ok.

But I will say there's a small handful of people that I follow that I didn't know before I joined Mastodon, and I think they're really cool.

#### I use software development as a crutch.

The past year hasn't been awesome for me, and I took that lack of control in one part of my life and put it into software development instead.  Something you may not know if you don't spend a lot of time telling a computer what to do: It's very gratifying.  It always listens.  Things work exactly the way you tell them to.  And if they don't work, it's your fault and you can spend time fixing it.  The world is 100% controllable inside a computer, always.

In 2018 I shipped a bunch of software on a bunch of platforms.  But before that I was writing music.  I stopped writing music because it was easier to write software and I thought maybe I could make a larger impact.  I should get back to music because it's harder for me to do so.

#### I don't think as highly about Mastodon as I once did, but I still am completely behind the Fediverse.

I jumped into writing this client before I had a real feel for the Fediverse as a whole and I wanted to focus on Mastodon.  Since then I've grown disillusioned with Mastodon and its leadership.  I've since pulled my financial backing from its Patreon and I no longer feel invested in that particular project's success. 

So you might be asking _"Why don't you just release something less Mastodon-specific?"_ and that's a fantastic question.  There are a handful of great alternative Fediverse servers out there that's compatible with ActivityPub, but there's a problem: Mastodon.  Given Mastodon is the biggest game in town other servers are trying to be (and you could argue need to be) API compatible.  And this is not a bad thing, in fact, it's great.  The problem lies with Mastodon itself and the fact that it has a funded, full-time developer who makes all the decisions for the project single handedly.  So if he, one night in a fever dream, decides to add some crazy feature to Mastodon then the other clients **and** servers have to either adopt that or get left out.  So we have one person calling the shots on client API compatibility, so apps like Mastochist can talk to servers, and ActivityPub implementations so all of the Fediverse can talk to each other.  I once brought this up in a post on the Fediverse, and instead of a mature conversation coming out of it, the person in question replied with "pee pee poo poo" and then sent all of his fanboys after me.  So ultimately I don't know what's going to happen with all of that, but I see a future of pain if I were to release and maintain a Fediverse client into the future as a side project.

#### I'm a shitty capitalist.

I've never charged for independent software I've written, and I doubt I'd start now.  That means I'd get burnt out, as all the drama listed above would require some serious money to keep up with that crap.

#### We're only months away from a hundred lousy Marzipan apps anyway.

Let's be honest here, the world of Mac software is about to change soon. I thought my passion for the platform would allow me to build something that showed how much I care for macOS, but nobody really cares but me given that people are already perfectly happy using the web on their desktops during the rare moments they're not just using their phones for everything, anyway.

#### I don't think it's good enough.

That's probably the smallest issue, because I could just make it better and the problem would be solved.  But ultimately, even though I completely believe it's better than every client available out there right now, and I use Mastochist exclusively every day, releasing something that's just a better version of something you can just do on the web... what's the point?  In the big picture of it all it doesn't really change anything.  Most people are happy with the web and I should probably stand down in my fight against the web taking over because I'm losing that battle.

I had a lot of really great power-user features that I looked forward to building, but I had to earn that by building something really great as a version 1.0, and that just didn't happen.  Better than the rest still doesn't mean good enough.

#### So why don't I just open source it?

That idea always sounds great, and it is a great idea.  But it takes just as much effort to release something usable as open source as it does writing it in the first place.  Ultimately nobody really would want to do anything more than critique the code and make frivolous pull requests for typos in comments.  It's not like releasing it as an open source project would get a bunch of people to rally behind it and release it.  I tried to find people who would be interested in working with me on the project early on, and nobody was interested, so that would be no different now.

#### So what now?

I don't know.  I built with AppKit for the first time and came out of it with a better understanding of Apple frameworks I've never had an opportunity to use before.  But whoopdie fucking do, right?  Nobody was on their death bed lamenting the fact they didn't get an opportunity to spend more time with NSGridView.

As for me on the Fediverse, I'm not going anywhere.  I'm not going back to Twitter or Facebook, and I look forward to what the future of federated social holds for all of us.  I'll probably even continue to use Mastochist until it stops working, because I hate the others and I'd probably post way less if I didn't have it.  But it's time to move forward and discover that part of me that doesn't lie within my code editor.

<img src="/blog/images/farewell-mastochist.png">