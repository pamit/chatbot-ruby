require 'chatbot/commands/greeting'
require 'chatbot/commands/about'
require 'chatbot/about'

module Chatbot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Chatbot with Watson'
      desc 'This is a bot'

      command 'about' do
        desc 'About the bot'
      end

      command 'greeting' do
        desc 'The greeting flow'
      end
    end
  end
end
