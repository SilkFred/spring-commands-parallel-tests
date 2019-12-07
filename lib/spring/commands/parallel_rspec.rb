require 'spring/application'

module Spring
  # Patch Spring to work with parallel_tests
  # From: https://github.com/grosser/parallel_tests/wiki/Spring
  class Application
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

  module Commands
    class ParallelRSpec
      def env(*)
        "test"
      end

      def exec_name
        "parallel_rspec"
      end

      def gem_name
        "parallel_tests"
      end

      def call
        ::RSpec.configuration.start_time = Time.now if defined?(::RSpec.configuration.start_time)
        load Gem.bin_path(gem_name, exec_name)
      end
    end

    Spring.register_command "parallel_rspec", ParallelRSpec.new
    Spring::Commands::Rake.environment_matchers[/^spec($|:)/] = "test"
  end
end
