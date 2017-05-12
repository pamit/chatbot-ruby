require 'slack-ruby-bot'
require 'httparty'
require 'byebug'
require 'logger'

# Dir["./chatbot/**/*.rb"].each {|file| require file }
require 'chatbot/version'
require 'chatbot/about'
require 'chatbot/commands'
require 'chatbot/bot'
require 'watson_api/service'
