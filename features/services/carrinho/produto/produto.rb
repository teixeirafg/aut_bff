module Bff
  module Rest
    class Produto
      include HTTParty

      headers 'Content-Type' => 'application/json',
              'X-Device' => DISPOSITIVO,
              'Authorization' => gerar_token

      base_uri URL[BANDEIRA][AMBIENTE]['carrinho'] + ENDPOINT['produto']

      def post_produto(request)
        response = self.class.post('', body: request.to_json)
        generate_evidence response
        response
      end

      def delete_produto(request)
        response = self.class.delete('', query: request)
        generate_evidence response
        response
      end

      def patch_produto(request)
        response = self.class.patch('', body: request.to_json)
        generate_evidence response
        response
      end
    end
  end
end
