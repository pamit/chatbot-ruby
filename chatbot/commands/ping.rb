module Chatbot
  module Commands
    class Ping < SlackRubyBot::Commands::Base
      command 'ping' do |client, data, _match|
        client.say(channel: data.channel, text: 'pong')
      end
    end
  end
end
