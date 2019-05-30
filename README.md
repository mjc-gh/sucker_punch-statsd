# SuckerPunch::Statsd

This gem makes it easy to use statsd with
[sucker_punch](https://github.com/brandonhilkert/sucker_punch).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sucker_punch-statsd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sucker_punch-statsd

## Usage

First, configure `SuckerPunch::Statsd` with a `:client` and optional
`:prefix`.

```ruby
SuckerPunch::Statsd.configure client: statsd_client, prefix: 'my_app'
```

The `:client` argument should be a Statsd instance that
responds to a `measure` method. Any of the following should work:

- [statsd](https://github.com/reinh/statsd)
- [statsd-instrument](https://github.com/Shopify/statsd-instrument)
- [dogstatsd-ruby](https://github.com/DataDog/dogstatsd-ruby)

Now, include the module in any job class that you want to measure

```ruby
class LogJob
  include SuckerPunch::Job
  include SuckerPunch::Statsd

  # The perform method is automatically wrapped in a Statsd measure
  # block.
  def perform
    Log.new(event).track
  end
end
```

## License

The gem is available as open source under the terms of the [MIT
License](https://opensource.org/licenses/MIT).

It was built in my spare time to support my work at [Knotch,
](https://www.knotch.it), where we help make brands smarter!

## Code of Conduct

Everyone interacting in the SuckerPunch::Statsd project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mjc-gh/sucker_punch-statsd/blob/master/CODE_OF_CONDUCT.md).
