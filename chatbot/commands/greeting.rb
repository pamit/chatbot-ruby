require 'json'

module Chatbot
  module Commands
    class Greeting < SlackRubyBot::Commands::Base
      match(/^(?<bot>\w*)\s(?<expression>.*)$/)

      def self.call(client, data, match)
        expression = match['expression'].strip
        return if expression.empty?

        mem = WatsonApi::Mem.instance.get(data.user)
        context = JSON.parse(mem) rescue nil
        msg = WatsonApi::Service.instance.message(expression, context)
        if msg&.context&.system&.branch_exited_reason == 'completed'
          WatsonApi::Mem.instance.set(data.user, nil)
        elsif msg&.context&.system&.branch_exited_reason != 'fallback'
          mem = WatsonApi::Mem.instance.set(data.user, msg&.context.to_json)
        end

        if msg&.output&.text.present?
          client.say(channel: data.channel, text: "#{msg&.output&.text&.join(' ')}")
        end
      end

    end
  end
end
