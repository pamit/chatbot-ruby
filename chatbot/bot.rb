require 'chatbot/commands/hi'
require 'chatbot/commands/about'
require 'chatbot/commands/ping'
require 'chatbot/about'

module Chatbot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Chatbot with Watson'
      desc 'This is a bot'

      command 'about' do
        desc 'About the bot'
      end

      command 'ping' do
        desc 'The famous ping-pong operation'
      end

      command 'hi' do
        desc 'The greeting flow'
      end
    end
  end
end
