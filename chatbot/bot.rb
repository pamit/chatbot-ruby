module Chatbot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Chatbot with Watson'
      desc 'This is a bot'

      command 'ping' do
        desc 'The famous ping-pong operation'
      end

      command 'hi' do
        desc 'The greeting flow'
      end
    end
  end
end
