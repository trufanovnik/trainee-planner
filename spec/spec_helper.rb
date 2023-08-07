require 'database_cleaner/active_record'
require 'database_cleaner/redis'

RSpec.configure do |config|
  # Setting expectations with RSpec syntax
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Setting up mocks using RSpec syntax
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Customizing the behavior of shared contexts depending on the metadata of the example groups
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Setting the cleanup strategy for ActiveRecord
  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner[:active_record].clean_with(:truncation)
  end

  # Setting a cleanup strategy for Redis
  config.before(:suite) do
    DatabaseCleaner[:redis].strategy = :truncation
  end
  
  # Run cleaning before and after each test
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

# To use matchers in Rspec test
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
