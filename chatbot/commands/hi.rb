module Chatbot
  module Commands
    class Hi < SlackRubyBot::Commands::Base
      operator '_>'
      command 'hi'

      def self.call(client, data, match)
        client.say(channel: data.channel, text: "Greetings")
      rescue StandardError => e
        client.say(channel: data.channel, text: "Sorry, #{e.message}.")
      end
    end
  end
end
