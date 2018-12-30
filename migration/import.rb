# coding: utf-8

require 'rubygems'
require 'hpricot'
require 'nokogiri'
require 'fileutils'
require 'safe_yaml'
require 'time'
require 'uri'
require 'open-uri'

module JekyllImport
  # This importer takes a wordpress.xml file, which can be exported from your
  # wordpress.com blog (/wp-admin/export.php).
  module WordpressDotCom
    attr :image_folder
    @image_folder = 'squarespace_images'

    def self.download_image(src, dest)
      return if ::File.exist? dest  # Speed-up for when importing multiple times
      File.open(dest, "wb") do |saved_file|
        # the following "open" is provided by open-uri
        open(src, "rb") do |read_file|
          saved_file.write(read_file.read)
        end
      end
    end

    def self.process(filename = {:source => "Squarespace-Wordpress-Export-12-29-2018.xml"})
      Dir.mkdir @image_folder unless ::File.exist? @image_folder

      import_count = Hash.new(0)
      doc = Hpricot::XML(File.read(filename[:source]))

      (doc/:channel/:item).each do |item|
        title = item.at(:title).inner_text.strip
        permalink_title = item.at('wp:post_name').inner_text.gsub("/","-")
        # Fallback to "prettified" title if post_name is empty (can happen)
        if permalink_title == ""
          permalink_title = sluggify(title)
        end

        if item.at('pubDate')
          begin
            date = Time.parse(item.at('pubDate').inner_text)
          rescue
            date = Time.now
          end
        else
          date = Time.now
        end

        status = item.at('wp:status').inner_text

        if status == "publish"
          published = true
        else
          published = false
        end

        type = item.at('wp:post_type').inner_text
        categories = item.search('category[@domain="category"]').map{|c| c.inner_text}.reject{|c| c == 'Uncategorized'}.uniq
        tags = item.search('category[@domain="post_tag"]').map{|t| t.inner_text}.uniq
        date = Time.parse(item.at('pubDate').inner_text)

        metas = Hash.new
        item.search("wp:postmeta").each do |meta|
          key = meta.at('wp:meta_key').inner_text
          value = meta.at('wp:meta_value').inner_text
          metas[key] = value;
        end

        author = {
          'name' => 'Gabe Kangas',
          'website' => 'http://gabekangas',
          'email' => 'gabek@real-ity.com',
          'github' => 'https://github.com/gabek',
          'image' => '/images/avatar-64x64.png'
        }

        # Identify Squarespace-hosted images, download them, and update the
        # URLs to point to our copies
        body = item.at('content:encoded').inner_text
        body = body.gsub(/\[\/?caption[^]]*\]/, '')  # Remove caption blocks which don't render properly
        doc = Nokogiri::HTML(body)
        doc.css('img').each do |element|
          puts element
          src = element['src']
          u = URI src
          if u.host.end_with? 'squarespace.com'
            filename = u.path.sub(/^\//, '').gsub('/', '_') + '_' + (u.fragment || '')
            dest = ::File.join(@image_folder, filename)
            download_image(src, dest)
            element['src'] = '/' + dest
          end
        end
        body = doc.to_s

        name = "#{date.strftime('%Y-%m-%d')}-#{permalink_title}.html"
        header = {
          'layout' => type,
          'title' => title,
          'categories' => categories,
          'tags' => tags,
          'status' => status,
          'type' => type,
          'published' => published,
          'date' => date,
          'meta' => metas,
          'author' => author
        }

        begin
          FileUtils.mkdir_p "_#{type}s"
          File.open("_#{type}s/#{name}", "w") do |f|
            f.puts header.to_yaml
            f.puts '---'
            f.puts body
          end
        rescue => e
          puts "Couldn't import post!"
          puts "Title: #{title}"
          puts "Name/Slug: #{name}\n"
          puts "Error: #{e.message}"
          next
        end

        import_count[type] += 1
      end

      import_count.each do |key, value|
        puts "Imported #{value} #{key}s"
      end
    end

    def self.sluggify(title)
      title.gsub(/[^[:alnum:]]+/, '-').downcase
    end
  end
end

JekyllImport::WordpressDotCom.process