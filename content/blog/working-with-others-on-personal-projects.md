---
title: 'Working with others on personal projects'
description: "How do you emulate the feeling of working with others when you're working alone?"
date: '2019-02-16'
type: 'post'
categories:
  - 'blog'
tags:
  - 'blog'
  - 'projects'
  - 'software'
  - 'development'

draft: false
cardthumbimage: "/blog/images/working-with-others-on-personal-projects.jpg" #optional: default solid color if unset
cardheaderimage: "/blog/images/working-with-others-on-personal-projects.jpg" #optional: default solid color if unset
cardbackground: '#263238' #optional: card background color; only shows when no image specified
images: ["/blog/images/working-with-others-on-personal-projects.jpg"]
'author':
  name: 'Gabe Kangas'
  website: 'http://gabekangas.com/'
  email: 'gabek@real-ity.com'
  github: 'https://github.com/gabek'
  image: '/images/avatar-64x64.png'
---

I like working with other people.  I like having people to throw ideas off of, and having sanity checks for approaches I'm taking with things.  I like the additional creativity that happens when you have another voice in the conversation and I like learning from people who know more about a topic than I do.

This is generally pretty difficult with personal projects.  And for whatever reason many of my projects start with me using a technology I've never used before.  So I wanted to write a bit about my experiences, and my attempts to try to add other voices to something that at it's core is only my thing.

When I first built The Bat Player for Roku, [I had never touched Roku development before](/blog/2014/12/developing-for-roku/).  In fact I had never met a single person who had.  So I wrote it completely in the open on Github in hopes that other people looking at Roku projects might be interested.  I should have known better because there aren't many Roku developers in the first place, so the chances that there would be a drive-by collaborator is pretty low.

I did the same with [The Bat Player for AppleTV](/project/thebatplayer/), knowing the chances for somebody showing interest in working on an AppleTV app when checking it out on Github would be much higher.  The app wasn't even completed yet when **somebody copied it, changed the name, and [put it on the App Store](http://www.148apps.com/app/1051556217/) under his own name.**  Then **he started a crowdfunding campaign for it** so he could hire people to continue work on it.  I immediately pulled it from Github and never put it back after convincing him to remove it from the AppleTV App Store and to stop his funding campaign.

<img src="/blog/images/rr-player-kickstarter.jpg">

So we have an example of somebody who could have reached out to me and said "hey, I love your app, can I be a part of it?"  Instead he stole it and tried to make money off of my work.  Maybe we could have made a great team if he wasn't so horrible.

When I started on [Longtail Music](/project/longtail-music/) I knew there were lots of opportunities to get other people involved.  On purely the product side I had never built a web app in React before, and in general never built a web app of that scale before, as I'm not a day to day web developer.  On top of that a lot of the work for Longtail focused on non-technical communications with station owners, reaching out to stations, and all of the management of those relationships.  So I spent time on cofounder forums, had conversations with people, followed leads, but no luck.  Finding a cofounder is hard.  If you're a technical person you need to find a business person to buy into your product, and business people already think their ideas are better, since they're the "idea people".  And if you're a business person looking to find a technical person, you have to convince somebody to build something for free in order to fulfill your idea.  I'm of the former, and finding somebody to help with the non-technical role in Longtail didn't work out.

As for building Longtail, obviously just putting your code on Github isn't a way to actively find collaborators and share knowledge and build something.  You have to be far more proactive than that.  And there's **nothing more proactive then going and hiring somebody to work with you on a piece of a project**.  So that's exactly what I did.

There were a couple times during development that I really wanted a second set of eyes when working through technical things, and I was willing to pay for this.  So I hired a freelance contractor to work on a couple things with me.  Some time was spent getting familiar with the project and then he bailed saying they were unable to help.  So I tried a couple more times, and pattern repeated itself.  Once it was time to actually work on something the person would duck out saying that they were unable to move forward.  So here is an example of me, learning something new, building something new, wanting to pick up some tips, best practices and collaborate with somebody else... **and I'm paying them**, still with no luck.

While I could take this personally and interpret it as "the work I do is so horrible", or "I'm so horrible that people refuse to work with me on it", I think the truth is these online freelancers aren't good at working in an existing codebase, feel over their heads, or would prefer to be hired by non-technical people to throw new projects together, not work hand-in-hand with somebody technical on an existing project where they could be judged.  And frankly, **you can't pay somebody to care or put effort in**.  At least not at my budget.

So realistically, I know it's not me, but that doesn't mean I don't have a slight complex about the whole thing.  I have a 0% track record trying to get people to work with me on projects.  **If I'm paying them**.

I'd understand if I was asking for something crazy, but generally the scenario is:

1. I'm trying something new.
2. I find a freelancer who's an expert claiming a deep background in it.
3. I want them to share their knowledge and best practices with me.
4. **But they can't**.

Usually the comments are along the lines of _"this project is much more elaborate than I thought"_, or _"I no longer have the time that I expected to work on this project"_.

My coworkers seem to like working with me, and I have a track record of shipping things, so it seems like people might want to work on things that are shared interests.

So why am I writing about this now?  Currently I'm writing my first macOS AppKit application.  While much of my experience working in iOS can be transferred to the desktop, there are handfuls of quirks very specific to the storied history of AppKit on the Mac, and given that AppKit was released in 1989 I wanted to dig into all that experience that people have and get some tips and best practices from people who specialize in it.  **You can probably guess how well that turned out**.

I'll close on a more positive note, though.  I've been fortunate enough to hire a couple designers who I personally know, both for my current project and for Longtail Music that have worked out.  I assume that hiring a designer is far more successful for me not just because I knew them previously, but because I'm not a designer.  I think there's a far different vibe when working *with* somebody and working *for* somebody.  With design I say "here's kind of what I'm thinking, go crazy", some time goes by, and then I get some results.  With developers I'm looking to work hand-in-hand, learn something, and create output together.  And unless you're super confident and super capable that style of work is probably uncomfortable for people.

<img src="/blog/images/forever-alone.png">