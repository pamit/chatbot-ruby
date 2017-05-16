require 'spec_helper'

describe Chatbot::Commands::Greeting do
  def app
    Chatbot::Bot.new
  end
  it 'greeting' do
    # expect(message: 'hi').to respond_with_slack_message("Hello, how are you?")
  end
end
