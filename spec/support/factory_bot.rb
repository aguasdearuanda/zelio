# frozen_string_literal: true

require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.factories.clear
    FactoryBot.definition_file_paths = %w[spec/factories]
    FactoryBot.find_definitions
  end
end
