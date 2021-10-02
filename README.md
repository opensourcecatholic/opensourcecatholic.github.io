# Open Source Catholic

This Jekyll project powers <https://www.opensourcecatholic.com/>.

Open Source Catholic's mission is to help Catholic developers and organizations involved in software and web development find effective solutions for spreading the Gospel of Jesus Christ.

See [CONTRIBUTING](CONTRIBUTING.md) if you'd like to contirbute a blog post.

## Website History

The website was originally built on Drupal 7, and ran with a forum, user blogs and project listings for almost eight years before it was migrated to a static Jekyll site, with comments migrated from Drupal to Disqus.

You can contribute content to Open Source Catholic following the guide in CONTRIBUTING.md.

## Local Development

Building the site locally requires Ruby. We recommend installing Ruby using [rbenv](https://github.com/rbenv/rbenv). You should install and use a version of ruby matching the one specified in [.ruby-version](.ruby-version).

To get started building the site locally, run the following commands in the project directory:

  1. `gem install jekyll bundler`
  2. `bundle install`
  3. `bundle exec jekyll serve`
  4. Open [http://localhost:4000/](http://localhost:4000/) in a web browser

### Updating Gems

To update the gems in `Gemfile.lock` (if they are out of date), run `bundle update` and commit the new `Gemfile.lock`.
