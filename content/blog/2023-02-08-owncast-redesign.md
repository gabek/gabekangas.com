---
title: Owncast v0.1.0 Retrospective - Redesign
description: Some behind the scenes discussion design challenges of the new release.
summary: With Owncast v0.1.0 in a bug fixing and early testing phase now, I thought I’d write some blog posts about what it’s been like to work on the project. A lot of projects don’t go into depth about how the sausage is made, but I still think people are interested in what’s going on even though they don't go out of their way to ask.
date: "2023-02-08"
type: "post"
categories:
  - blog
tags:
  - blog
  - owncast
  - design
author: "Gabe Kangas"
---

With Owncast v0.1.0 starting a bug fixing and a super early testing phase now, I thought I’d write some blog posts about what it’s been like to get this far in this rather large release. A lot of projects don’t go into depth about how the sausage is made, and Owncast is no exception. I’m generally an open book if you ask or are involved with contributing to the project, but I usually don’t go out of my way to share every little thing with people who aren’t involved.

For this first post I thought I’d start with a goal that I was very passionate about for this release, a redesign. And while I'm trying to be both respectful and honest it might seem like I'm being too much of one or another. Keep in mind that I appreciate every person who has been involved with Owncast in any capacity, and I respect their thoughts and any amount of energy they've put into the project.

Going forward I promise other topics will be more positive, and I'll be writing about the other goals for this release in future posts.

## History of a redesign

I heard from so many people for such a long time that they liked Owncast but it _"needed polish"_ or _"it looked bad"_ or _"the design needs help"_. And while there were never constructive action items, suggestions, or offers to help, I knew they were right and I looked forward to the opportunity to improve it.

Like a lot of open source projects Owncast originally started small, with few features. As the project grew more things got added and the UI requirements became more complex. Few of the components or design elements shared styles, type, or colors because they were just slapped on as needs arose. **I felt now was the time to take a step back and start fresh with the Owncast web application frontend.** I wanted to design from scratch and then build the UI from scratch. After that we can get back to building new features, hopefully with a design and architecture that serves the project well for years to come.

**I took this redesign seriously and I wanted to do it right.** Since visual design isn't one of my core strengths I decided to find somebody who could work with the project.

## Finding design help

I've never been able to catch the attention of designers to help with Owncast. And given my lack of design skills I feel quite vulnerable that there’s a skill I don't have, and not sure how to acquire, leading to being completely dependent on somebody other than myself. When it comes to Owncast I generally haven’t had success when relying on others, but without a designer in-house I knew to accomplish this big project I'd have to find a design agency.

It started as you’d expect, with me sharing everything I could about Owncast with the agency. It’s important that at this “product” level that they are 100% informed about what it is you’re building, why you’re building it, and who you’re building it for. I wrote documents about use cases and the different types of users. I provided lists of requirements and lists of things I didn’t want. I gave examples of work that I enjoyed and examples of things I didn’t like.

The reaction from an outsider to Owncast wasn't unexpected. _“Owncast is kind of like Twitch? **Let’s make it look like Twitch!**”_ And that’s a valid starting point, it’s not uncommon to use existing products as a way to start. But unfortunately **I was unable to force progress from there**. The more I pushed to not look like Twitch the more they straight up copied Twitch’s colors, layout, iconography and more. I’d say _“This wouldn’t work for a church”_ or _“A school would never want a 100% black page with swords”_. Months of back and forth took place without much progress, and with other large topics such as mobile layouts, modals and user flows still up in the air **I realized I knew this project wouldn't be completed with this particular partnership**.

I was disappointed, but I wasn’t ready to give up. This is when I, again, started hitting the Fediverse, forums, Linkedin, and other social platforms looking for somebody who could help with a new design of Owncast. I told everyone to share this request with their friends and colleagues. I needed help.

Lucky for me some people responded, and each time they did I was immensely excited. A person who wants to help, it always makes me **so happy**.

## Trying to accomplish a long-term project with short-term contributions

I'm thankful for each person who has ever showed up with hopes to help with Owncast, so I don't want to come off as harsh or ungreatful. But I was unprepared for the challenges of trying to manage a long-term project such as the entire look and feel of the web application when people were unable to commit to seeing it through.

A project such as a redesign requires a long term commitment. It’s not like code contributions where you can jump in quick, fix a typo, and then never show up again. So what would happen is somebody would show interest, I'd get them up to speed on our requirements, they'd spend time working out what tools they wanted to use, start working on something, and then no longer be able to contribute for one reason or another. So I’d ask around again, and somebody new would graciously jump in but with the caveat that they **start the design over from scratch** because they didn’t like what the previous person did. A couple times I agreed out of desperation for help, but each time they’d disappear and the cycle would restart. New person, new tools, new design, no progress. **New person, new tools, new design, no progress**.

It's not uncommon to want to work on the sexy stuff, I totally get that. While I had a list of _"Needs Design"_ tasks like authentication modals and error states it was primarily things like chat that people wanted to start over on each time, leading to a long list of things that couldn't get any attention.

Eventually I had to make the call that there would be **no more complete restarts** of design work because at some point I needed progress to be made. So going forward each person would **build upon the work of the person before them**. And as expected people had no interest in working on error states and menus so **all design interest from anybody completely went away**.

With over half of a year passed, with nothing more than little bits and pieces of incomplete or unusable design scattered here and there we simply took the old layout of Owncast and started rebuilding it. No new colors, no new layout. People will see this rebuild and think "What took so long? It looks the same."

After all of this time, effort, and money, the redesign was a failure.

## What could have been done differently?

As the project maintainer this failure was completely my fault. I was operating purely on ambition, hoping the complimentary design skill set could be found one way or another and we'd end up building something that everyone was super proud of.

Maybe it was foolish to take upon a project where I didn’t have that skill set required to accomplish it myself. Maybe I need to double down on the approach that if I can’t do it myself, then Owncast shouldn’t try it. But that would be so sad. **I want to believe that I can work with others to accomplish a goal that’s bigger than something I could do on my own.**

I think design and visually creative efforts will always be a challenge with Owncast and it's not something I'll be able to fix overnight. But I do hope that if I keep pushing hard enough I can appeal to people who care about visual design and want to see their efforts and vision reflected in the project.

But just in case I did buy a couple books on design that I'm making my way through.
