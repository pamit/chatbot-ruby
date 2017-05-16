RSpec.configure do |config|
  config.before do
    SlackRubyBot.config.user = 'chatbot2'
  end
end
