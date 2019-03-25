module Bff
  module Rest
    class Departamentos
      include HTTParty

      headers 'Content-Type' => 'application/json'

      base_uri URL[BANDEIRA][AMBIENTE]['departamento'] + ENDPOINT['departamento']

      def get_departamento
        response = self.class.get('')
        generate_evidence response
        response
      end
    end
  end
end
