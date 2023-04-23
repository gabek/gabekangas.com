---
title: Upcoming Owncast features
description: When the housekeeping rewrite and refactoring is done, I'm looking forward to building some new features.
date: "2023-04-24"
type: "post"
categories:
  - blog
tags:
  - blog
  - owncast
  - fediverse
  - activitypub
author: "Gabe Kangas"
---

While I try to keep a [public roadmap](https://owncast.online/roadmap), and keep a reasonable plan for Owncast, I rarely have an opportunity to gush to anybody (other than my therapist, and he doesn't get it) about features I’m looking forward to building. So I thought I’d write a quick blog post to share some of my personal thoughts on my vision of future Owncast features from a high level.

## The frontend rewrite

Owncast has been going through a [large frontend rewrite](https://github.com/owncast/owncast/milestone/18) over the past year. And this wasn’t done lightly. It was done because I strongly felt if I wanted to build the features I had envisioned I wasn’t going to get there with the current frontend architecture, capabilities and tooling. So once this ships, I can get back to building features again! I’m really looking forward to that.

Admittedly I have some backend infrastructure refactoring planned once the frontend ships, but I do expect that to be more straightforward since it doesn't require UI.

## Powered by ActivityPub

Practically every one of these features are backed by ActivityPub, and therefore supports federating with the Fediverse in some capacity. While some of these features may not have any available external interface to them yet, I hope some day for that to change. I'd love to work with more platform developers to make that happen. I'm super into the idea of robust Fediverse platform interoperability and I can't wait to see what we can build together.

## Scheduled streams

The first big one I’m looking forward to are scheduled streams. The ability to say “I stream at 7:30 every Tuesday” or “This Friday I have an event at 6pm”. It will be a really nice thing to feature on the Owncast stream page itself, so when you visit a stream that’s offline it tells you when you might want to come back. But that’s not the most interesting thing.

People will be able to subscribe to a calendar so they have this schedule available to them wherever they are, so the real fans are always up to date. Additionally I can propagate this scheduled data to the Fediverse, updating the server’s profile info to include the next stream info, and inform followers that a stream is coming up soon. It’s all about informing people via different ways that something they might care about is coming up. I’m super excited about adding this functionality and I think it’ll benefit streamers and viewers alike.

I'd also love for these events to be actionable on the Fediverse. I've looked into what it would take to [federate with Mobilizon](https://github.com/owncast/owncast/issues/2375) but that doesn't look possible. But if you know anybody over on that project, send them to me! Additionally, wouldn't you like seeing an Owncast event come through your Mastodon timeline and there could be an explicit "see event" button or something built right in? Tell your friends who build your favorite microblogging Fediverse platform!

## Replays

Next is a category of features I call “replays”. Some people want "archival", meaning a bunch of video files they can download, but that's not the goal here. I explicitly call these “replays” because that’s the point, for a viewer to be able to re-play part or whole of a stream.

The plan is to start with clips. And while that’s technically more challenging, with more UI and requirements from my side, I believe it has the most value. I think being able to share highlights of a stream will help grow people’s viewership more than entire streams.

I would also love for these clips to be Federated with PeerTube, but my expectations of that is going to stay low for now unless I can get some help from them to open things up and allow federating with non-PeerTube ActivityPub instances. Anybody know anybody at PeerTube? I’d love to chat.

The entire replay project will be large, with a lot of design and UI requirements that admittedly I’m worried about. As I’ve [blogged about in the past](/blog/2023/02/owncast-v0.1.0-retrospective-redesign/) I’ve had a near impossible time getting design help, and it’s by far the skill set I have the hardest time with. So it’s going to be a long journey to get to where I’m trying to get to. But I’ll cross that bridge when I get to it.

## Mini Directories

Something that people have asked for is to be able to run their own Owncast directories. The thought is that some communities and groups would like to be able to run multiple Owncast instances and have a way to link them all together. And while I’ve always thought that would be interesting, I’ve never been able to justify starting yet another rather large standalone software project that needs to be built, documented, supported, updated, etc for just a couple of people. It’s not as simple as open sourcing the current [Owncast directory](https://directory.owncast.online) site for a number of reasons.

So the solution I’m looking at is essentially making every Owncast server to be a mini directory. Via ActivityPub (the standardized protocol that powers the Fediverse), each Owncast server will “Follow” other servers, and then the servers would federate between each other things like stream status (live/offline), schedule, and more. They could even list non-Owncast instances in their directory, as long as they are on the Fediverse. This means you could add PeerTube channels in your Owncast mini directory if you wanted to. But of course they wouldn’t have all the additional federated info unless the remote server sent the required ActivityPub data. But there's nothing stopping that from happening.

And because things like stream state will be federated between Owncast instances, you could essentially mimic a Twitch-style “raid” because once your stream ends it’ll know what other streams are currently live, and can recommend your viewers to check them out.

Cool, right?

### Powered by standards

In theory any Fediverse service could send the correct activities to Owncast and share state to show up in this directory (as long as the Owncast instance has explicitly followed the remote account, of course). I hope this will expand some of the things we do with decentralized, federated data. I have a [PR up](https://github.com/gabek/fedidocs/pull/10) in the FediDevs repo to discuss Federated presence standardization that would be behind this feature.

Can’t wait to build this stuff. [I hope some of you join me!](https://owncast.online/help)
