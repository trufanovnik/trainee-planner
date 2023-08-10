require 'simplecov'
SimpleCov.start

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
end
