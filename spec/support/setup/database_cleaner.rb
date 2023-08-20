# frozen_string_literal: true

require 'database_cleaner-active_record'
require 'database_cleaner-redis'

RSpec.configure do |config|
  # Setting the cleanup strategy for ActiveRecord
  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner[:active_record].clean_with(:truncation)
  end

  # Setting a cleanup strategy for Redis
  config.before(:suite) do
    DatabaseCleaner[:redis].strategy = :deletion
  end

  # Run cleaning before and after each test
  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
