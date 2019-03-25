Dado('ter uma massa configurada do endpoint carrinho.get para o cenário {string}') do |tipo|
  step 'chamar o endpoint carrinho.delete'
  step "ter uma massa configurada do endpoint carrinho_produto.post para o cenário '#{tipo}'"
  step 'chamar o endpoint carrinho_produto.post'
  @carrinho_get = RequestCarrinho.obtem_infos_produto_cb(@carrinho_produto.id_produto['produto'])
end

Quando('chamar o endpoint carrinho.get') do
  @carrinho_get ||= OpenStruct.new
  begin
    @carrinho_get.response = carrinho.get_carrinho
  rescue StandardError => error
    @carrinho_get.error = error
  end
end

Então('validar o retorno do endpoint carrinho.get para o cenário {string}') do |_tipo|
  endpoint = @carrinho_get
  expect(endpoint.error).to be_nil
  expect(endpoint.response['skus']).not_to be_nil
  expect(endpoint.response['skus'][0]['nome']).to eql endpoint.body['nome']
  expect(endpoint.response['skus'][0]['sku']).to eql endpoint.body['sku']
  expect(endpoint.response['skus'][0]['lojista']['id']).to eql endpoint.body['id_lojista']
  expect(endpoint.response['skus'][0]['lojista']['nome']).to eql endpoint.body['nome_lojista']
  expect(endpoint.response['skus'][0]['lojista']['marketplace']).to be_falsey
  expect(endpoint.response['mensagemErro']).to be_nil
end

Dado('ter uma massa configurada do endpoint carrinho.delete para o cenário {string}') do |_tipo|
  RequestCarrinho.adiciona_dois_ou_mais_produtos_carrinho
end

Quando('chamar o endpoint carrinho.delete') do
  @carrinho_delete ||= OpenStruct.new
  begin
    @carrinho_delete.response = carrinho.delete_carrinho
  rescue StandardError => error
    @carrinho_delete.error = error
  end
end

Então('validar o retorno do endpoint carrinho.delete para o cenário {string}') do |_tipo|
  response_get = carrinho.get_carrinho
  endpoint = @carrinho_delete
  expect(endpoint.error).to be_nil
  expect(endpoint.response).to be_nil
  expect(endpoint.response.code).to eql 200
  expect(response_get['skus']).to be_empty
end
