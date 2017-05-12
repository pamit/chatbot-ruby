$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'chatbot-ruby'
require 'web'
require 'logger'

$logger = Logger.new(STDOUT)
Thread.abort_on_exception = true

Thread.new do
  begin
    Chatbot::Bot.run
  rescue Exception => e
    $logger.error "ERROR: #{e}"
    $logger.error e.backtrace
    raise e
  end
end

run ChatbotRuby::Web
