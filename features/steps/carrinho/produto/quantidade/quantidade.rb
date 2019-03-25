Dado('ter uma massa configurada do endpoint bff_carrinho_produto_quantidade.get para o cenário {string}') do |_tipo|
  endpoint = OpenStruct.new
  step 'chamar o endpoint carrinho.delete'
  endpoint['quantidade'] = RequestCarrinho.adiciona_dois_ou_mais_produtos_carrinho
  @carrinho_produto_quantidade = endpoint
end

Quando('chamar o endpoint bff_carrinho_produto_quantidade.get') do
  @carrinho_produto_quantidade ||= OpenStruct.new
  begin
    @carrinho_produto_quantidade.response = quantidade.get_quantidade
  rescue StandardError => error
    @carrinho_produto_quantidade.error = error
  end
end

Então('validar o retorno do endpoint bff_carrinho_produto_quantidade.get para o cenário {string}') do |_tipo|
  endpoint = @carrinho_produto_quantidade
  expect(endpoint.error).to be_nil
  expect(endpoint.response['quantidade']).to eql @carrinho_produto_quantidade['quantidade']
end
