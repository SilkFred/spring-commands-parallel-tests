# spring-commands-parallel-rspec

This gem implements the `parallel_rspec` command for
[Spring](https://github.com/rails/spring).

This is a fork of the [spring-commands-rspec](https://github.com/jonleighton/spring-commands-rspec) gem to suppor the `parallel_rspec` command from the [parallel_tests](https://github.com/grosser/parallel_tests) gem.

This gem force-enables Spring, since `parallel_tests` [disables Spring by default](https://github.com/grosser/parallel_tests/blob/master/lib/parallel_tests/cli.rb#L13). It also automatically [patches Spring to reload the database configuration](https://github.com/grosser/parallel_tests/wiki/Spring), which allows you to use `<%= ENV['TEST_ENV_NUMBER'] %>` in `database.yml`.

See these GitHub issues and PRs for more information:

* [parallel_tests#309](https://github.com/grosser/parallel_tests/issues/309)
* [parallel_tests#468](https://github.com/grosser/parallel_tests/issues/468)
* [parallel_tests#469](https://github.com/grosser/parallel_tests/issues/469)

## Usage

Add to your Gemfile:

``` ruby
gem 'spring-commands-parallel-rspec', group: :development
```

If you're using spring binstubs, run `bundle exec spring binstub parallel_rspec` to generate `bin/parallel_rspec`.
Then run `spring stop` to pick up the changes.
