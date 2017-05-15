module WatsonApi
  class Service
    include HTTParty
    include Singleton
    base_uri 'https://gateway.watsonplatform.net/conversation/api/v1'

    def initialize
      auth = { username: ENV['WATSON_USERNAME'], password: ENV['WATSON_PASSWORD'] }
      headers = { 'Content-Type' => 'application/json' }
      @version = ENV['WATSON_WORKSPACE_VERSION']
      @options = {}.merge!({ basic_auth: auth, headers: headers })

      # @ws_id = WatsonApi::Service.instance.workspaces.workspaces.first.workspace_id
      @ws_id = "dbb8a837-10fa-42a2-a569-392b7ea4c5ba"
    end

    def workspaces
      return parse(self.class.get("/workspaces?version=#{@version}", @options), __method__)
    end

    def message(msg, context={})
      body = { input: { text: msg } }
      body.merge!({ context: context })
      @options.merge!({ body: body.to_json })
      $logger.info "WatsonApi :: #{__method__} _> #{@options.inspect}"
      return parse(self.class.post("/workspaces/#{@ws_id}/message?version=#{@version}", @options), __method__)
    end

    private

      def parse response, fn
        code = response.code
        $logger.info "WatsonApi :: #{fn} _> (#{code}) #{response.body}"

        result = errors = nil
        if (200..201).include? code
          body = JSON.parse(response.body)
          result = Hashie::Mash.new(body)
        else
          errors = "error!"
        end
        return result
      end
  end
end
