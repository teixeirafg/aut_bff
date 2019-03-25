module Bff
  module Rest
    class Captcha
      include HTTParty

      headers 'Content-Type' => 'application/json', 'X-Device' => DISPOSITIVO

      base_uri URL[BANDEIRA][AMBIENTE]['login'] + ENDPOINT['captcha']

      def get_captcha
        response = self.class.get('')
        generate_evidence response
        response
      end
    end
  end
end
