#!/usr/bin/env ruby

require 'yaml'

def slugify(text)
    text = text.gsub(/'/, "")
    text = text.gsub(/[^a-zA-Z0-9]/, "-")
    text = text.gsub(/-+/, "-")
    if text.start_with?("-")
        text = text [1..-1]
    end
    if text.end_with?("-")
        text = text[0..-2]
    end
    return text.downcase
end

authors = {}

Dir.glob('../_posts/*.md') do |filename|
    puts filename
    
    frontmatter = YAML.load_file(filename)
    name = frontmatter['author']
    author = slugify(name)
    authors[author] = name
    
    post = File.read(filename)
    File.open(filename, 'w') do |f|
        f.puts(post.gsub(/author:.*$/, "author: #{author}"))
    end
end

File.open('authors.yml', 'w') do |f|
    authors.sort.each do |author, name|
        f.puts("#{author}:")
        f.puts("  name: #{name}")
    end
end

