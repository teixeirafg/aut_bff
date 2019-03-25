Dado('ter uma massa configurada do endpoint carrinho_produto.post para o cenário {string}') do |tipo|
  @carrinho_produto = tipo.eql?('positivo') ? RequestProduto.obtem_infos_produto_cb : RequestProduto.obtem_infos_produto_cb_invalido
  step 'chamar o endpoint carrinho.delete'
end

Quando('chamar o endpoint carrinho_produto.post') do
  @carrinho_produto ||= OpenStruct.new
  begin
    @carrinho_produto.response = produto.post_produto(@carrinho_produto.body.to_h)
  rescue StandardError => error
    @carrinho_produto.error = error
  end
end

Então('validar o retorno do endpoint carrinho_produto.post para o cenário {string}') do |tipo|
  endpoint = @carrinho_produto
  expect(endpoint.error).to be_nil
  if tipo.eql?('positivo')
    expect(endpoint.response['sku']).to eql endpoint.body['sku']
    expect(endpoint.response['idLojista']).to eql endpoint.body['idLojista']
    expect(endpoint.response['idCarrinhoSku']).not_to be_nil
  else
    endpoint.response = JSON.parse(endpoint.response)
    expect(endpoint.response['mensagem']).to eql 'Ocorreu um erro no processamento desta pagina, por favor tente novamente!'
    expect(endpoint.response['mensagemLog'][0]).to eql 'Ocorreu um erro no processamento desta pagina, por favor tente novamente!'
  end
end

Dado('ter uma massa configurada do endpoint carrinho_produto.delete para o cenário {string}') do |tipo|
  step "ter uma massa configurada do endpoint carrinho_produto.post para o cenário 'positivo'"
  step 'chamar o endpoint carrinho_produto.post'
  @carrinho_produto_delete = RequestProduto.produto_carrinho(@carrinho_produto, tipo)
end

Quando('chamar o endpoint carrinho_produto.delete') do
  @carrinho_produto_delete ||= OpenStruct.new
  begin
    @carrinho_produto_delete.response = produto.delete_produto(@carrinho_produto_delete.path.to_h)
  rescue StandardError => error
    @carrinho_produto_delete.error = error
  end
end

Então('validar o retorno do endpoint carrinho_produto.delete para o cenário {string}') do |tipo|
  endpoint = @carrinho_produto_delete
  if tipo.eql?('positivo')
    step 'chamar o endpoint bff_carrinho_produto_quantidade.get'
    expect(endpoint.error).to be_nil
    expect(@carrinho_produto_quantidade.response['quantidade']).to eql 0
  else
    expect(endpoint.response['mensagem']).to eql 'Foram encontrados erros de validação no request'
    expect(endpoint.response['erros'][0]['campo']).to eql 'IdLojista'
  end
end

Dado('ter uma massa configurada do endpoint carrinho_produto.patch para o cenário {string}') do |tipo|
  step "ter uma massa configurada do endpoint carrinho_produto.post para o cenário 'positivo'"
  step 'chamar o endpoint carrinho_produto.post'
  @carrinho_produto_patch = RequestProduto.quantidade_produtos_carrinho(@carrinho_produto, tipo)
end

Quando('chamar o endpoint carrinho_produto.patch') do
  @carrinho_produto_patch ||= OpenStruct.new
  begin
    @carrinho_produto_patch.response = produto.patch_produto(@carrinho_produto_patch.body.to_h)
  rescue StandardError => error
    @carrinho_produto_patch.error = error
  end
end

Então('validar o retorno do endpoint carrinho_produto.patch para o cenário {string}') do |tipo|
  endpoint = @carrinho_produto_patch
  expect(endpoint.error).to be_nil
  if tipo.eql?('positivo')
    response_request = quantidade.get_quantidade
    expect(endpoint.response.body).to be_empty
    expect(response_request['quantidade']).to eql endpoint.body['quantidade']
  else
    endpoint.response = JSON.parse(endpoint.response.body)
    expect(endpoint.response['erros'][0]['campo']).to eql 'Quantidade'
    expect(endpoint.response['erros'][0]['mensagem']).to eql 'The field Quantidade must be between 1 and 6.'
    expect(endpoint.response['mensagem']).to eql 'Foram encontrados erros de validação no request'
  end
end
