require 'json'

module Chatbot
  module Commands
    class Hi < SlackRubyBot::Commands::Base

      match(/^(.+)$/) do |client, data, match|
        begin
          return if data.text.empty?

          mem = WatsonApi::Mem.instance.get(data.user)
          context = JSON.parse(mem) rescue nil
          msg = WatsonApi::Service.instance.message(data.text, context)
          if msg&.context&.system&.branch_exited_reason == 'completed'
            WatsonApi::Mem.instance.set(data.user, nil)
          elsif msg&.context&.system&.branch_exited_reason != 'fallback'
            mem = WatsonApi::Mem.instance.set(data.user, msg&.context.to_json)
          end

          if msg&.output&.text.present?
            client.say(channel: data.channel, text: "(#{data.user}) #{msg&.output&.text&.join(' ')}")
          end
        rescue Exception => e
          client.say(channel: data.channel, text: "Sorry, something went wrong")
          $logger.error "#{__method__}: #{e.message}"
          raise e
        end
        
      end
    end
  end
end
