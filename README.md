# DelayedRedirect

This gem is a tiny piece of Rails middlware that allows a redirect to be specified in the response headers after the page has been rendered.

This is useful for situations where you want to render a complete page for SEO purposes, as well as redirecting afterwards.

## Usage

In your controllers

```ruby
delayed_redirect_to '/zh-Hans/users/login', status: 302
````

Only the first call to delayed_redirect_to is honoured. Subsequent redirects are ignored.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'delayed_redirect'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install delayed_redirect
```

## Contributing

Fork, test, code, pull request

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
