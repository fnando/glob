# Glob

[![](https://github.com/fnando/glob/workflows/tests/badge.svg)](https://github.com/fnando/glob/actions?query=workflow%3Atests)

Create a list of hash paths that match a given pattern. You can also generate a
hash with only the matching paths.

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

There are two types of paths: `include` and `exclude`.

- The `include` path adds that node to the new hash.
- The `exclude` path is the one started by `!`, and will prevent that path from
  being added.

The latest rules have more precedence; that means that if you have the rule
`*.messages.*`, then add a following rule as `!*.messages.bye`, all
`*.messages.*` but `*.messages.bye` will be included.

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

glob << "*.settings.*"

glob.paths
#=> ["site.settings.name", "site.settings.url", "user.settings.name"]

glob.to_h
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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/fnando/glob. This project is intended to be a safe, welcoming
space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Glob project’s codebases, issue trackers, chat rooms
and mailing lists is expected to follow the
[code of conduct](https://github.com/fnando/glob/blob/main/CODE_OF_CONDUCT.md).
