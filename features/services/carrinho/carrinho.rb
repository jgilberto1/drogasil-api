module Bff
  module Rest
    class Carrinho
      include HTTParty

      headers 'Content-Type' => 'application/json'
      base_uri "#{URL[AMBIENTE]}#{ENDPOINT['cart']}"

      def addItem(request)
        response = self.class.post('/items', body: request.to_json, headers: { 'Authorization' => 'Bearer ' + ApiCommons.token_login })
        ApiCommons.generate_evidence response
        response
      end

      def consultaItems(_request)
        response = self.class.get('/totals', headers: { 'Authorization' => 'Bearer ' + ApiCommons.token_login })
        ApiCommons.generate_evidence response
        response
      end

      def atualizaItem(request)
        response = self.class.put('/items/901781', body: request.to_json, headers: { 'Authorization' => 'Bearer ' + ApiCommons.token_login })
        ApiCommons.generate_evidence response
        response
      end

      def deletaItems(request)
        response = self.class.delete("/items/#{request}", headers: { 'Authorization' => 'Bearer ' + ApiCommons.token_login })
        ApiCommons.generate_evidence response
        response
      end
    end
  end
end
