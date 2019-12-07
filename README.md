# spring-commands-parallel-tests

This gem adds the following commands from [parallel_tests](https://github.com/grosser/parallel_tests) to [Spring](https://github.com/rails/spring):

* `parallel_test`
* `parallel_rspec`
* `parallel_cucumber`
* `parallel_spinach`

By including `spring-commands-parallel-tests` in your `Gemfile`, the gem will automatically [patch Spring to reload the database configuration](https://github.com/grosser/parallel_tests/wiki/Spring). This allows you to use `<%= ENV['TEST_ENV_NUMBER'] %>` in `database.yml`. It also force-enables Spring, since `parallel_tests` [disables Spring by default](https://github.com/grosser/parallel_tests/blob/master/lib/parallel_tests/cli.rb#L13). (However, you can still disable Spring by setting `DISABLE_SPRING=1`.)

See these GitHub issues and PRs for more information about using Spring with `parallel_tests`:

* [parallel_tests#309](https://github.com/grosser/parallel_tests/issues/309)
* [parallel_tests#468](https://github.com/grosser/parallel_tests/issues/468)
* [parallel_tests#469](https://github.com/grosser/parallel_tests/issues/469)

## Usage

Add to your Gemfile:

``` ruby
gem 'spring-commands-parallel-tests', group: :development
```

If you're using spring binstubs, you can run the following commands to generate the respective binstubs:

* `bundle exec spring binstub parallel_test`
* `bundle exec spring binstub parallel_rspec`
* `bundle exec spring binstub parallel_cucumber`
* `bundle exec spring binstub parallel_spinach`

Then run `spring stop` to pick up the changes.

## Credits

This gem is a fork of the [spring-commands-rspec](https://github.com/jonleighton/spring-commands-rspec) gem by [@jonleighton](https://github.com/jonleighton).

## License

MIT
