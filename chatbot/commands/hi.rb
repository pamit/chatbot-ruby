module Chatbot
  module Commands
    class Hi < SlackRubyBot::Commands::Base
      # operator '='
      # command 'hi'
      # def self.call(client, data, match)
      #   ws = WatsonApi::Service.instance.workspaces
      #   msg = WatsonApi::Service.instance.message(ws.workspaces.first.workspace_id, data.text, nil)
      #   client.say(channel: data.channel, text: "#{msg.output.text.join(' ')}")
      # rescue StandardError => e
      #   client.say(channel: data.channel, text: "Sorry, #{e.message}")
      # end

      match /^(.+)$/ do |client, data, match|
        begin
          return if data.text.empty?
          # ws = WatsonApi::Service.instance.workspaces
          ws_id = "dbb8a837-10fa-42a2-a569-392b7ea4c5ba" # ws.workspaces.first.workspace_id
          msg = WatsonApi::Service.instance.message(ws_id, data.text, nil)
          client.say(channel: data.channel, text: "#{msg.output.text.join(' ')}")
        rescue Exception => e
          client.say(channel: data.channel, text: "Sorry, something went wrong")
          $logger.error "#{__method__}: #{e.message}"
          raise e
        end
      end
    end
  end
end
