# Open Source Catholic

This Jekyll project powers http://www.opensourcecatholic.com/

Open Source Catholic's mission is to help Catholic developers and organizations involved in software and web development find effective solutions for spreading the Gospel of Jesus Christ.

## Website History

The website was originally built on Drupal 7, and ran with a forum, user blogs and project listings for almost eight years before it was migrated to a static Jekyll site, with comments migrated from Drupal to Disqus.

You can contribute content to Open Source Catholic following the guide in CONTRIBUTING.md.

## Local Development

To get started building the site locally, run the following commands in the project directory:

  1. `gem install jekyll bundler` (use `sudo` if you get a permission error)
  2. `bundle install --path vendor/bundle`
  3. `bundle exec jekyll serve`
  4. Browse to [http://localhost:4000/](http://localhost:4000/)

To update the gems in `Gemfile.lock` (if they are out of date), run `bundle update`.
