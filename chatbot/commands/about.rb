module Chatbot
  module Commands
    class Default < SlackRubyBot::Commands::Base
      match(/^(?<bot>\w*)$/)

      def self.call(client, data, match)
        client.say(channel: data.channel, text: Chatbot::ABOUT)
      end
    end
  end
end
