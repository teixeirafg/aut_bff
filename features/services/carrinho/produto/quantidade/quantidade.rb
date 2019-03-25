module Bff
  module Rest
    class Quantidade
      include HTTParty

      headers 'Content-Type' => 'application/json',
              'X-Device' => DISPOSITIVO,
              'Authorization' => gerar_token

      base_uri URL[BANDEIRA][AMBIENTE]['carrinho'] + ENDPOINT['quantidade']

      def get_quantidade
        response = self.class.get('')
        generate_evidence response
        response
      end
    end
  end
end
