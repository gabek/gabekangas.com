#!/usr/bin/env ruby

require 'html2markdown'

POST_REGEX = %r{(?<year>[0-9]+)-(?<month>[0-9]+)-(?<day>[0-9]+)-(?<title>.*).html}

files = Dir.glob('*.html').select{ |f| f.match POST_REGEX }

files.each do |post|
  data = post.match(POST_REGEX)
  p = HTMLPage.new(contents: File.read(post))

  File.open(post, 'w') { |f| f.puts p.markdown }
  File.rename(post, "#{data[:year]}-#{data[:month]}-#{data[:day]}-#{data[:title]}.md")
end