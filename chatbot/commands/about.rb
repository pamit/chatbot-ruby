module Chatbot
  module Commands
    class About < SlackRubyBot::Commands::Base
      # match(/^(?<bot>\w*)$/) do |client, data, _match|
      command 'about' do |client, data, _match|
        client.say(channel: data.channel, text: Chatbot::ABOUT)
      end
    end
  end
end
