Web Console for Rails 3
=======================

[![Travis](https://travis-ci.org/gsamokovarov/web-console-rails3.png)](https://travis-ci.org/gsamokovarov/web-console-rails3) [![Version](https://badge.fury.io/rb/web-console-rails3.png)](http://badge.fury.io/rb/web-console-rails3)

[Web Console] is great and all, but by default, it only runs on _Rails 4_. If
you can't easily upgrade your application to _Rails 4_, you can use this build
to get to [Web Console] running on _Rails 3.2_.

Requirements
------------

While _Rails 3.2_ is supported, you would still have to be running _MRI Ruby
1.9.3_ and above. It may run on _Rubinius_ and _JRuby_, but we haven't tested
those yet.

Installation
------------

To install it in your current application, add the following to your `Gemfile`.

```ruby
group :development do
  gem 'web-console-rails3', '~> 0.4.0'
end
```

After you save the `Gemfile` changes, make sure to run `bundle install` and
restart your server for the [Web Console] to take affect.

By default, it should be available in your development environment under
`/console`. The route is not automatically mounted in a production environment
and we strongly encourage you to keep it that way.

More
----

For more information visit _Web Console_ [home page][Web Console].

  [Web Console]: https://github.com/gsamokovarov/web-console
