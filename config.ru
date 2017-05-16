$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
require 'chatbot-ruby'
require 'web'

Dotenv.load
Thread.abort_on_exception = true

Thread.new do
  begin
    Chatbot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run ChatbotRuby::Web
