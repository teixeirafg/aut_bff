module Bff
  module Rest
    class Carrinho
      include HTTParty

      headers 'Content-Type' => 'application/json',
              'X-Device' => DISPOSITIVO,
              'Authorization' => gerar_token

      base_uri URL[BANDEIRA][AMBIENTE]['carrinho'] + ENDPOINT['carrinho']

      def get_carrinho
        response = self.class.get('')
        generate_evidence response
        response
      end

      def delete_carrinho
        response = self.class.delete('/produtos')
        generate_evidence response
        response
      end
    end
  end
end
