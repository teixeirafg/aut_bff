module Bff
  module Rest
    class Auth
      include HTTParty

      headers 'Content-Type' => 'application/json', 'X-Device' => DISPOSITIVO

      base_uri URL[BANDEIRA][AMBIENTE]['login'] + ENDPOINT['token']

      def post_auth(request)
        response = self.class.post('', body: request.to_json)
        generate_evidence response
        response
      end
    end
  end
end
