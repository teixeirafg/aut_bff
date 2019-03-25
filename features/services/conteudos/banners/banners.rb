module Bff
  module Rest
    class Banners
      include HTTParty

      headers 'Content-Type' => 'application/json',
              'X-Device' => DISPOSITIVO

      base_uri URL[BANDEIRA][AMBIENTE]['conteudos'] + ENDPOINT['banners']

      def get_banners
        response = self.class.get('')
        generate_evidence response
        response
      end
    end
  end
end
