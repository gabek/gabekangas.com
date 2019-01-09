---
title: 'Building a Gopher Phlog using Hugo'
description: 'first post with Hugo website engine'
date: 2019-01-07 17:32:39.000000000 +00:00
categories:
  - 'post'
tags:
  - 'gopher'
  - 'blog'
draft: true
type: post
cardthumbimage: '/blog/images/hugo-gopher-phlog.png' #optional: default solid color if unset
cardheaderimage: '/blog/images/hugo-gopher-phlog.png' #optional: default solid color if unset
'author':
  name: 'Gabe Kangas'
  email: 'gabek@real-ity.com'
  github: 'https://github.com/gabek'
  image: '/images/avatar-64x64.png'
---

I've recently (re)discovered Gopher. A protocol that predates the web and was used for sharing documents, links and textual information. It dates back to 1991 and while in the mid 90s I did do some digging around in Gopherholes, I was admittedly catching the end of its popularity.

Because of somebody I follow on Mastodon, I learned that there are handfuls of people who host their personal blogs (they call them phlogs) using gopher. Once I saw this I fell in love with the idea and had to try it.

Given I just [rebuilt my web site](/blog/2019/01/new-web-site-for-2019/), I wanted to see how I could render my site in plaintext for use on a gopher server at the same time I render the HTML web version. I came up with a pretty decent solution, and thought I'd share it hoping that others would expand their content into a Gopherspace.

### Config File Changes

A few changes need to be made to the Hugo config file to tell it about the new output you want to render.

#### Create a media type.

This is referenced later when creating an output format. `text/gopher` is obviously not a real type, but it's nice to keep it specific in case you want other plain text outputs down the road.

{{< highlight toml >}}
[mediaTypes]
	[mediaTypes."text/gopher"]
		suffixes = ["txt"]
{{< / highlight >}}

#### Create an output format

Here you're telling Hugo that a newly rendered output option is going to be available. If you don't yet have an `outputFormats` section, create that. And there you'll add a new format. I suggest you call it Gopher for clarity with a new `outputFormats.Gopher` section.

You can give it any name and extension that you want, but I figured `post.txt` for blog posts in plain text makes the most sense. But if you change `post.txt` to something else you'll need to change it in the gophermap template blow.

{{< highlight toml >}}
[outputFormats]
  [outputFormats.Gopher]
	baseName = "post"
    isPlainText = true
    isHTML = false
    mediaType = "text/gopher"
    path = "gopher"
    suffix = "txt"
{{< / highlight >}}

#### Create an `outputs` section to specify what types of content get rendered as what.

{{< highlight toml >}}
[outputs]
  page = ["HTML", "Gopher"]
  section = ["HTML", "Gopher"]
{{< / highlight >}}

This says to render each type of page as the built-in HTML support, and the newly created `Gopher` outputFormat that we defined above. Take note that the above `outputFormats.Gopher` name needs to match the `Gopher` output specified here.

### Create your post's plain text render template

First, we'll need to do some plain text data munging to try and fix gaps in formatting going from Markdown -> Plain text, and I centralized that in a [Hugo Shortcode](https://gohugo.io/content-management/shortcodes/).
So create a file, `layouts/partials/gopher/plaintextify.html` that contains the following regex replacements for taking the Markdown and sanitizing it for plaintext usage.

{{< highlight go >}}
{{- $plainTextContent := . }}

{{- $plainTextContent = replaceRE "{{</*[^>]**/>}}" "" $plainTextContent }}
{{- $plainTextContent = replaceRE "<[^>]*>" "" $plainTextContent }}
{{- $plainTextContent = replaceRE `\[(.*?)\][\[\(].*?[\]\)]` "$1" $plainTextContent }}
{{- $plainTextContent = replaceRE `\!\[(.*?)\]\s?[\[\(].*?[\]\)]` "" $plainTextContent }}
{{- $plainTextContent = replaceRE `\n={2,}` "" $plainTextContent }}
{{- $plainTextContent = replaceRE `\*\*([^*]+)\*\*` "" $plainTextContent }}

{{- htmlUnescape $plainTextContent | safeHTML }}

{{< / highlight >}}
Take note, I cherry picked these regexes from [go-strip-markdown](https://github.com/writeas/go-strip-markdown/blob/master/strip.go) so visit that source if you'd like some other quick Markdown stripping expressions.  If you've found a cleaner way than these replacements to get better plain text output from Markdown, please let me know!

Then you can make a simple template in the file `layouts/_default/single.gopher.txt` that uses the above shortcode and could look like this:

{{< highlight go >}}
{{ .Title }}
{{ .Date.Format "Jan 2, 2006" }}

{{ partial "gopher/plaintextify.html" .RawContent }}
{{< / highlight >}}


### And then create your gophermap template

You'll need another template that's essentially your "home page" for your Gopherspace, called a `gophermap`. This will be a Hugo `list` template in a very specific format located in the file `layouts/_default/list.gopher.txt`. This enables links to other spots in your Phlog.
You'll need to iterate over your own content, since the example is specific to my posts, but It can look something like this:

{{< highlight go >}}
Recent blog posts

{{- range $index, $element := first .Site.Params.frontpageposts (where .Site.Pages "Section" "blog") }}
0{{ .Date.Format "Jan 2, 2019" }} {{ .Title }}	{{substr .RelPermalink 1}}post.txt
{{ end }}
{{< / highlight >}}

**Important**, the template above has as a _TAB_ in it and is important that be a tab and not a space.

{{< highlight go >}}
0{{ .Date.Format "Jan 2, 2019" }} {{ .Title }[TAB]{{substr .RelPermalink 1}}post.txt
{{< / highlight >}}

Read more about the format of a gophermap at [sdf.org/?tutorials/gopher](https://sdf.org/?tutorials/gopher#publish). You can expand yours to be as fancy as you like, and link both internally to your own content, and externally to other gopherholes. I suggest you learn how it works in order to get other types of links to work correctly.

### Render your site

Lastly, run `hugo` and have it generate your static files. Your new gopher content will be in `public/gopher`. You'll notice `public/gopher/post.txt` is your gophermap, so rename that file to `gophermap` before uploading it to your gopher server.

You will see your gophermap have links that look like the following:

{{< highlight go >}}
Recent blog posts
0Jan 1, 2019 New web site for 2019      blog/2019/01/new-web-site-for-2019/post.txt
{{< / highlight >}}

and each blog post will be rendered to a `post.txt` plain text file in the respective directories.

And that's it! Now when you author content and render your HTML site in Hugo you'll get a bonus Phlog. If you're looking for a free provider to host your shiny new Gopherhole I suggest you get a free shell account at [sdf.org](https://sdf.org/). If you don't know much about UNIX, here's an awesome opportunity to learn.

One thing I wish I could do, but I can't find a way to pull off is to get the Blackfriday markdown renderer, that is used in Hugo, to render Markdown to formatted plain text. You might be thinking "Markdown is plain text!" And that's true, but you also have image markup, and anchor tags and text formatting. But I understand this is a niche requirement, so regex and text formatting methods in the template itself will have to do.

You can see the commit I made to my Hugo site to enable the above changes [here](https://github.com/gabek/gabekangas.com/commit/2c13523c831e7cee3510dad92d77e59fda97a2f7) if you'd like to see a real-world example.

I'm both new to Hugo and Gopher, so I wouldn't be surprised if there were different or better ways to accomplish this task. So if you're more knowledgable than I am about either of these topics, I'd love to chat about ways to get more stuff into the world of Gopher.
