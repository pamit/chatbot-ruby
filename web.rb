require 'sinatra/base'

module ChatbotRuby
  class Web < Sinatra::Base
    get '/' do
      'Hi bot!'
    end
  end
end
