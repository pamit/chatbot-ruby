module Chatbot
  module Commands
    class About < SlackRubyBot::Commands::Base
      command 'about' do |client, data, _match|
        client.say(channel: data.channel, text: Chatbot::ABOUT)
      end
    end
  end
end
