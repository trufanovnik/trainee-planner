require 'database_cleaner/active_record'
require 'database_cleaner/redis'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  config.shared_context_metadata_behavior = :apply_to_host_groups

# Установка стратегии очистки для ActiveRecord
  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner[:active_record].clean_with(:truncation)
  end
# Установка стратегии очистки для Redis
  config.before(:suite) do
    DatabaseCleaner[:redis].strategy = :truncation
  end
# Запуск очистки перед и после каждого теста
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end