---
title: Owncast v0.1.0 Retrospective - Frontend Web Rewrite
description: One of the high level goals for Owncast since day one was hackibility, but this created downsides. It was time for a change.
date: "2023-02-17"
type: "post"
categories:
  - blog
tags:
  - blog
  - owncast
  - web development
author: "Gabe Kangas"
---

This post is a continuation of posts leading up to Owncast v0.1.0 that discusses some of the high level goals for the release. Read the first post about a [Owncast redesign](/blog/2023/02/owncast-v0.1.0-retrospective-redesign/) for part 1.

## Hack the planet!

One of the high level goals for Owncast since day one was hackibility. I wanted what was shipped to be a starting point for people looking to run their own custom live streams, not a locked in experience.

I was determined to write the web frontend in a way that required no pre-processing, no bundling, no JavaScript compilers. Raw JavaScript, HTML and CSS would be shipped so making changes to these files would be as straightforward as opening the files in a text editor and making your changes.

To pull this off it meant making a lot of very specific web technology choices, or maybe more specifically, a lack thereof. There could be no modern web development tooling, no bundling of source files, no TypeScript, no SASS, no CSS modules, no UI component libraries, no Webpack, no Babel. Just a bunch of raw web source.

And it worked. My goal of giving people a bunch of plain text files they could edit was successful and I thought it was kind of cool. It traded a good developer experience for a better customization experience, but I felt that was a fair trade off.

I thought all this would be a positive for contributors, too. There would be no development environment. You just download Owncast and you start making changes to the frontend files. That’s as minimal as you can get, and I thought people would enjoy that when looking to help the project.

A nice middle ground was using [Preact](https://preactjs.com/) + [HTM](https://preactjs.com/guide/v10/getting-started/#alternatives-to-jsx). It allowed building frontend components in _almost_ the exact same syntax as React, but without all the overhead of React or JSX transpiling requirements. I thought it was a pretty sweet solution that allowed people with familiarity with React to still jump right in and feel at home.

## Serious downsides

Even though all the pieces of the puzzle worked, it became clear of the downsides.

### Frontend contributors were scared off

_Almost_ React is not React, and people were scared away from contributing on the frontend for pretty much the entirety of the project because Preact can look slightly different than React. People know what they know and like what they like, and me saying “anybody will be able to pick it up” didn’t make people feel comfortable enough to actually contribute.

### Everything was built from scratch

Because I was unable to take advantage of 3rd party UI components everything needed to be built from scratch. And as somebody who’s favorite part of software development isn’t deciding what a button’s hover state should look like, this really started to bother me. I wanted to build features, but every addition had a huge UI lift.

An additional, substantial, downside, was the accessibility of all these home grown components wasn’t great and I was always being told how awful of a person I was because of it.

### Nobody actually took advantage of it

While people would tweak a color or font here and there, my goals of allowing people to completely control their page never really appealed to people like I thought it would. It was infinitely hackable, but nobody cared to hack it.

## A change in direction

I started looking at all the features I wanted to build going into the future. Things like schedules, localization and recordings. But all I could think about was how I’d have to build, from scratch, calendars and scheduling components and reinvent the wheel to support translations. At this rate I’d never complete anything because I’d be spending all my time on UI and never complete features. There was nobody to help me, so I needed to figure out how to help myself make progress with the frontend. Changes had to be made.

I figured if people weren’t taking advantage of the raw source, and I had to give up so much in order to continue to ship it, I would make the call to completely change this approach.

I made sure to, multiple times, [warn people of this change](https://owncast.online/news/20230201-preparing-for-v010/), and then I’d take a rather large step backwards. By completely rewriting the UI using a new tech stack it would allow a better development experience in exchange for no longer shipping those raw web source files that nobody cared about anyway.

### A new stack

[Nextjs](https://nextjs.org/), [React](https://reactjs.org/), [Typescript](https://www.typescriptlang.org/), [CSS Modules](https://github.com/css-modules/css-modules), [Sass](https://sass-lang.com/), [Storybook](https://storybook.js.org/). I almost immediately started enjoying the process of web development more when I had tooling that made it more tolerable. I was moving faster, I was taking advantage of other tools, and in every direction there were positives (except the part where the entire thing had to be rebuilt).

### Contributors came

And it was almost overnight once Owncast stopped saying “Any web developer would feel at home with our stack” to explicitly saying “We use **React**”, the contributors started showing up and successfully contributing.

Really great people with insight, experience, and energy wanted to jump into the project and say “Hey, I know React. I know Typescript. I know Sass, let me help”. I can’t tell you how great that made me feel to finally get some help on the frontend after so long being frustrated with the situation.

A **huge** thank you to everyone who's been involved with the work going into this release. There was so much to do and each person who jumped in to help made a world of difference.

### Progress

All of a sudden this huge goal that I created of rebuilding the entire Owncast interface started getting chipped away. I’d look at the issues that were in progress and there were more than just my name attached to them.

I started to see things paying off. Now the page loads faster because I was able to tree shake unused code, and code split things into specific bundles. I was able to experiment faster by using 3rd party components. The accessibility support was better because people who build UI components for a living are better at it than I am and I wasn’t reinventing the wheel at every turn.

The project is able to use Storybook to build and test components now, allowing contributors to help the project without even running a test instance of Owncast. They can load up Storybook and make changes. These changes can be validated by build tooling and UI snapshot tests can highlight the changes that are made.

And I can get a level of structure and strictness that JavaScript alone doesn’t afford by using Typescript. I like types. Writing JavaScript alone feels like I’m wiring up a bomb with no instructions on where the wires go.

None of this was possible before. At least not in a straightforward way.

## What did I learn?

I guess you could call the initial goals of infinite hackibility to be a sort of a premature optimization. I wanted people to have the ability to do something that I didn’t know if they wanted or not. And sometimes that’s ok when you don’t have to invest a lot, or give up so much to accomplish it, but in this case it wasn’t a fair trade off.

And while many people don’t agree, this is a concrete example of technology choices mattering. React is the biggest game in town, so using React appeals to more people. And even though a software developer can probably successfully work with any tech stack they try, not all of them want to try. No amount of me saying “It’ll be fine, just jump in” will convince them otherwise.

## In conclusion

Do I think the React+TypeScript stack is so wonderful? Not really. In fact, it has a **ton** of downsides. But did changing to it have significant upsides? **Absolutely**.

The old saying is pick the technology that can stay out of the way and lets you focus on only the parts that make you distinct. Moving to a React stack has really done this for me, the project, and the contributors.

I now have an entire ecosystem of tooling that I can plug right in to make my life easier. Issues get caught at build time with TypeScript. UI issues get caught in visual snapshot tests. Things are more accessible because I can bring in components that were improved over years. I could go on and on.

## Oh yeah, and the project is open for contributions

And lastly, I'd be missing an opportunity if I didn't call out that we're always looking for contributors to help with the project both on our new frontend, and the Go backend. Take a look at the [Contributing Guide](https://owncast.online/help) and jump in!
