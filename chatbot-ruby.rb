require 'slack-ruby-bot'
require 'httparty'
require 'byebug'
require 'logger'

require 'chatbot/bot'
require 'watson_api/mem'
require 'watson_api/service'

SlackRubyBot::Client.logger.level = Logger::ERROR
$logger = Logger.new(STDOUT)

SlackRubyBot.configure do |config|
  config.aliases = [':bot:', 'bot']
end
