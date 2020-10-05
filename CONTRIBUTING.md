# Contributing to Open Source Catholic

Open Source Catholic is a website where Catholics can share new ways of communicating the Gospel Message of Jesus Christ. See [About Open Source Catholic](https://www.opensourcecatholic.com/about/) for more info.

## How to Contribute a Blog Post

1. Fork this repository and clone it so you can work with a copy on your computer. If you need help with this, read [GitHub's Forking Guide](https://guides.github.com/activities/forking/).

2. Make a copy of `post_template.md` for your post, and put it in the `_posts` directory.

   ```
   $ cp post_template.md _posts/2020-01-01-your-title-here.md
   ```

3. Edit the metadata (the YAML frontmatter) at the top of your post to add a title, date, and categories to your post. Create a "username" for yourself as the author, and add your username to the `authors` section of `_config.yml`.

3. Write your post in [Markdown](https://kramdown.gettalong.org/quickref.html). If you'd like to preview your post, you can run the website locally by following the Local Development guide in the [README](README.md).

4. Open a PR to merge your post into the Open Source Catholic repository. One of the OSC admins will approve and merge your post.
