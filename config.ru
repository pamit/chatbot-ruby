$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'chatbot-ruby'
require 'web'


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
