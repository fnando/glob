# Glob

[![](https://github.com/fnando/glob/workflows/tests/badge.svg)](https://github.com/fnando/glob/actions?query=workflow%3Atests)

Create a list of hash paths that match a given pattern. You can also generate
a hash with only the matching paths.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "glob"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install glob

## Usage

```ruby
glob = Glob.new(
  site: {
    settings: {
      name: "Site name",
      url: "https://example.com"
    }
  },
  user: {
    settings: {
      name: "User name"
    }
  }
)

result = glob.query("*.settings.*")

result.paths
#=> ["site.settings.name", "site.settings.url", "user.settings.name"]

result.to_h
#=> {
#=>   site: {
#=>     settings: {
#=>       name: "Site name"
#=>     }
#=>   },
#=>   user: {
#=>     settings: {
#=>       name: "User name"
#=>     }
#=>   }
#=> }
```

Notice that the return result will have symbolized keys.

If you're planning to do one-off searches, then you can use
`Glob.query(target, paths)` instead.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fnando/glob. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Glob project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fnando/glob/blob/master/CODE_OF_CONDUCT.md).
