include Utils

class RequestProduto
  def self.obtem_infos_produto_cb
    produto = RequestCarrinho.obtem_infos_produto_cb
    endpoint = OpenStruct.new
    endpoint.body = OpenStruct.new
    endpoint.body['sku'] = produto.body['sku']
    endpoint.body['idLojista'] = produto.body['id_lojista']
    endpoint.id_produto = OpenStruct.new
    endpoint.id_produto['produto'] = produto.id_produto['produto']
    endpoint
  end

  def self.obtem_infos_produto_cb_invalido
    endpoint = OpenStruct.new
    endpoint.body = OpenStruct.new
    endpoint.body['sku'] = '999999999'
    endpoint.body['idLojista'] = obtem_infos_produto_cb.body['idLojista']
    endpoint
  end

  def self.produto_carrinho(produto, tipo)
    endpoint = OpenStruct.new
    endpoint.path = OpenStruct.new
    endpoint.path['IdCarrinhoSku'] = produto.response['idCarrinhoSku']
    endpoint.path['sku'] = produto.response['sku']
    endpoint.path['idLojista'] = produto.response['idLojista'] if tipo.eql?('positivo')
    endpoint
  end

  def self.quantidade_produtos_carrinho(produto, tipo)
    endpoint = OpenStruct.new
    endpoint.body = OpenStruct.new
    endpoint.body['idCarrinhoSku'] = produto.response['idCarrinhoSku']
    endpoint.body['quantidade'] = rand(2..5) if tipo.eql?('positivo')
    endpoint
  end
end
