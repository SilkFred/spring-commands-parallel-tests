# spring-commands-parallel-rspec

This gem implements the `parallel_rspec` command for
[Spring](https://github.com/rails/spring).

This is a fork of the [spring-commands-rspec](https://github.com/jonleighton/spring-commands-rspec) gem to suppor the `parallel_rspec` command from the [parallel_tests](https://github.com/grosser/parallel_tests) gem.

This gem also [patches Spring to reload the database configuration and reconnect the database](https://github.com/grosser/parallel_tests/wiki/Spring), which allows you to use `<%= ENV['TEST_ENV_NUMBER'] %>` in `database.yml`:

```ruby
require 'spring/application'

class Spring::Application
  alias connect_database_orig connect_database

  def connect_database
    disconnect_database
    reconfigure_database
    connect_database_orig
  end

  def reconfigure_database
    if active_record_configured?
      ActiveRecord::Base.configurations =
        Rails.application.config.database_configuration
    end
  end
end
```

> [See the discussion on this GitHub issue](https://github.com/grosser/parallel_tests/issues/309).


## Usage

Add to your Gemfile:

``` ruby
gem 'spring-commands-parallel-rspec', group: :development
```

If you're using spring binstubs, run `bundle exec spring binstub parallel_rspec` to generate `bin/parallel_rspec`.
Then run `spring stop` to pick up the changes.
