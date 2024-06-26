---
title: "It's time a for change: I'm trying Linux on the desktop"
description: 'I felt the need to do something different on my personal machine, and spend more time in Linux.  Here are my observations.'
date: '2019-05-20'
type: 'post'
categories:
  - 'blog'
tags:
  - 'blog'
  - 'linux'
  - 'computers'
draft: false
cardthumbimage: '/blog/images/linuxdesktop.jpeg' #optional: default solid color if unset
cardheaderimage: '/blog/images/linuxdesktop.jpeg' #optional: default solid color if unset
cardbackground: '#263238' #optional: card background color; only shows when no image specified
images: ['/blog/images/linuxdesktop.jpeg']
'author':
  name: 'Gabe Kangas'
  website: 'http://gabekangas.com/'
  email: 'gabek@real-ity.com'
  github: 'https://github.com/gabek'
  image: '/images/avatar-64x64.png'
---

I've felt lousy about the internet, software, computers and technology lately.  Recently I've abandoned a project of mine and that made me feel pretty bad.  It made me think about my relationship with my personal computer and the things I use it for.  I realized once I removed macOS and iOS software development from things I use my computer for I'm not really tied to a Mac.  And though I love macOS, Macintosh computers, and the entire Apple ecosystem, I just needed to look at something else for a while and rekindle that passion I have for my computer.

So I purchased a brand new computer, a Lenovo Thinkpad X1 Carbon.  Before I ever was a Mac user I had an IBM Thinkpad and I have such great memories of it.  Plus when I polled people on The Fediverse a lot of people suggested that there's good compatibility with Linux and the X1 hardware.  So I went to Central Computers in San Francisco, a real, physical computer store, and came out with a new laptop.

#### Picking a Linux distribution

The first step was picking a Linux distro that I'd be happy with.  I was originally suggested to check out [Pop!_OS](https://system76.com/pop) so I wrote the ISO to a USB drive and installed it.  I didn't really know much about it before I installed it, but there was no reason not to try it.  But after playing with it a bit I found something about the window management just to be a bit weird.  I couldn't really see what apps were open, and had to view submenus in order to get the state of the apps without a dock or something.  No big deal.  Next up, after doing a bit of reading, was [Linux Mint](https://linuxmint.com/) Cinnamon edition.  It seemed polished enough for a nice desktop, but also has some standard elements that I'd expect.  It took less than 5 minutes to download the ISO, write it to the USB drive and be booted up into it.  I can't explain how cool it is to be testing out different distributions so quickly.

#### Upfront impressions: Hardware + OS

With the OS installed I could poke around and check it out.  I noticed right away how much nicer it is to type on this Thinkpad keyboard than that horrible butterfly switch keyboard on the Apple Macbook Pro.

And while the keyboard is pretty great, one thing isn't: Keyboard shortcuts.  For some reason even something as simple as copy/paste shortcuts only work some places.  I can command+c in a web browser to copy text, but I can't command+v in the terminal to paste it.  But I can command+v in other apps.  There seems to be no rhyme or reason where shortcuts work and where they don't.

So many icons are blurry.  This machine has a high DPI screen, so I understand that's probably the problem, but why haven't the apps been updated to support modern screens?

After about a week of using this setup I looked into what I could do to get inertial (or kenetic) scrolling to work.  You know how if you fling the trackpad quickly it'll scroll quickly and decelerate over time.  It turns out it's kind of possible, but you have to change the mouse driver.  So I replaced [libinput](https://www.freedesktop.org/wiki/Software/libinput/) with the [Synaptics driver](https://wayland.freedesktop.org/libinput/doc/latest/faqs.html#kinetic-scrolling-does-not-work), and that helped.  But it's still "off", in that kind of hard to describe way.

But aside from that trackpad driver I didn't have to install any custom drivers, perform any hand editing of config files, or boot into a console to tweak some settings.  The actual Linux distros these days seem to be extremely solid out of the box.  The desktop environment and window managers have been polished and work great.

#### Installing software

So with Linux Mint installed, and me being happy enough with the standard elements of the OS, it was time to install the apps I will need to start gaining functionality.

There are handfuls of ways to install software in Linux and you never know what one you should look at first.

Linux Mint has this "Software Manager" that I think is probably just a GUI frontend to apt, or something.  It's a handy way to search for and install applications.  Some things, though, you'll want to, or have to, install via the command line.  That's even the case in macOS as Homebrew allows you to easily install a ton of unix software.

There's also some thing now called ["snap"](https://snapcraft.io/store) where you can install all-in-one app images of some sort that deal with dependencies, and that seems to work pretty well once you find it on the snap ecosystem.  It shows that the experience of installing applications in Linux has been a focus over the years, as there are a number of different ways now, all trying to be easier than the next.  Unfortunately they spent all the time on the installer UIs and not on the software itself.

#### The State of Linux Software

So if the actual Linux distribution and software experiences are great, then this whole thing sounds like a success, right?  Well, let's talk about the actual applications.

To be completely honest, it looks like Linux desktop applications have not been touched much since I last used Linux as a desktop OS over 10 years ago.  There doesn't seem to be any really polished applications, and ones that were around back then are still the ones people use now, and they're not any better than they were a decade ago.

I can only assume that the same thing I complain about on macOS desktops, that people have just given up and only use the web, is happening with Linux.  Or maybe Linux users just decided there's no reason to leave the terminal?  Is the reason why Thunderbird is still the best option for a mail client because everyone just uses stupid Gmail in their browser?

And sure there are some exceptions, there are technically more apps than there used to be.  But just like on the Mac, most of them are cross-platform Electron/Javascript apps.  Visual Studio Code is on Linux, so is Signal messenger, so is Whalebird for Mastodon and Keybase.  There's a new calendar app called MineTime that I found.  But all of those are just web apps in an Electron wrapper.

And while some applications are "bad", some are completely unusable.  Take for instance the application QOwnNotes, it's completely unusable because it just does its own thing as far as handling the screen resolution for some reason.  Spotify also does that, but at least with Spotify it's not a productivity app where you spend time in it getting work done, you just press play and minimize.  A note taking app where you can't read the notes is a good example of all the bad software for Linux on the desktop.

<img src="/blog/images/smalltextapp.png">

#### Using Linux daily

It's hard to really describe it.  But using Linux on the desktop, and Linux desktop apps, kind of feel like using a computer through a layer of mud.  Just moving the mouse cursor around, and pointing and clicking feels odd.  Everything is a little messy.

It's hard to put words to a lot of this.  But even typing this blog post I'll be typing and then the cursor will just jump to a random part of the document because I _guess_ I accidentally touched the trackpad while typing or something?  This kind of thing happens all the time and it's so frustrating.  If I try and highlight a block of text sometimes I end up deleting it, or dragging it somewhere else because of all these wierd rogue inputs.  You have to be super, super deliberate when using the trackpad because it feels like it's always out to trip you up.  I imagine using Linux with an external mouse and keyboard is a much, much more pleasant experience.  It feels like another example of how Linux stagnated over ten years ago, where Linux on a laptop was probably less popular and everyone was using beefy desktop computers with external devices.

Applications have no consistency to them whatsoever.  Some have menu bars, some have menu buttons, some have no menus.  So if you're looking for the "Preferences" window within an app you have to go digging.  Here's an example of a few different apps.  The browser has a three horizontal line "hamburger menu", Spotify has a dropdown associated with your profile image, Thunderbird has a menu bar, MimeTime has a three vertical line menu button, Tootle has a custom toolbar (and completely different minimize, maximize and close buttons), and Keybase has your profile image.  The cognitive overhead in using these apps is a little much.

<img src="/blog/images/wtfmenus.png">

Because I spend so much time in the macOS terminal much of using Desktop Linux feels comfortable.  I use my same dotfiles, so my bash prompt looks the same, and all the same tools are there in the terminal to use.  I still don't know why I can't paste using a keyboard shortcut there, though.


#### Things I miss

Many of these are all obvious, since there's a certain amount of Apple Integration Magic that you can't replicate once you leave that ecosystem, but it doesn't change the fact that there are a handful of things that I found to miss right away.

**There's no global spellcheck.**

I'm guessing this is due to none of the desktop applications playing by the same rules and it being a wild west of controls and text handling, so the idea of having any kind of global spell check is probably out of the question.

**Replying to text messages and iMessages from the desktop.**

Given that I don't really enjoy spending time on my phone, and I'm always at a computer anyway, the ability to respond to messages that come through my phone via my desktop computer was immediately missed as I started to have to reply to messages via my phone instead of a real keyboard.

**Cross-device copy and paste**

iOS and macOS have a shared clipboard.  I use this a ton.  One thing I do a lot is copying a password on my desktop and then pasting it in an app on my phone.  It's way faster than opening 1Password on my phone, unlocking it, searching for the login, and copying it.  And now that I have to use my phone to reply to text messages I really wish I could search for things on the desktop and paste them into a message response.

**Auto unlocking with my Apple Watch**

I'm one of those rare people who really enjoys their Apple watch, and it's like magic when I walk up to my computer and it unlocks without me typing in a password or even scanning my fingerprint.


#### Apps I'm using

I have a handful of apps I'm used to on macOS every day, and I needed to find equivalents.  Here's what I've come up with so far:

**Apps that exist on macOS and Linux**

* Brave browser
* Spotify
* 1Password (Only as a browser extension, though)
* Signal Messenger
* Dropbox
* Visual Studio Code
* Signal

**Replacements for daily use apps**

* Mail.app -> Mozilla Thunderbird
* [KeepIt Notes](https://reinventedsoftware.com/keepit/) (Syncs notes via iCloud) -> Maybe go back to Evernote?  I'd rather not.
* Mastodon client -> [Whalebird](https://whalebird.org/en/desktop/contents) (Electron app)
* Calendar.app -> [Minetime](https://minetime.ai) (Electron app)

**Apps with no replacements**

* iMessage

#### Takeaways and future

I **really** want this to work, but man, this kind of sucks.  I guess if I were a person who spent all day in a web browser using Google Docs, or only wanted to use the terminal then Linux would be mostly usable.  But I love native desktop apps, and the ones for Linux are not a pleasure to use.  Stack on top of that the horrible trackpad experience and me accidentally deleting things, typing over things, moving things around, and generally being a mess anytime I try and click things it makes me just not want to use the machine at all.

I know I won't get much constructive feedback, but if any of my complaints and concerns are something you've experienced and been able to work out for yourself, please let me know.  I really want to continue using Linux as a daily driver desktop OS at home, but I don't know how I can continue to do so outside of a short term experiment with the fundamental issues I'm experiencing.

As always, [find me on the Fediverse](https://social.gabekangas.com/gabek) and let's chat about it.