include Utils

class RequestCarrinho
  def self.obtem_infos_produto_cb(produto = nil)
    produto = "produto_#{rand(1..3)}" if produto.nil?
    endpoint = OpenStruct.new
    endpoint.body = OpenStruct.new
    endpoint.body['nome'] = API_DATA_PRODUTOS['produtos'][AMBIENTE][BANDEIRA][produto]['nome']
    endpoint.body['sku'] = API_DATA_PRODUTOS['produtos'][AMBIENTE][BANDEIRA][produto]['sku']
    endpoint.body['marca'] = API_DATA_PRODUTOS['produtos'][AMBIENTE][BANDEIRA][produto]['marca']
    endpoint.body['id_lojista'] = obtem_infos_lojista_cb['id_lojista']
    endpoint.body['nome_lojista'] = obtem_infos_lojista_cb['nome_lojista']
    endpoint.id_produto = OpenStruct.new
    endpoint.id_produto['produto'] = produto
    endpoint
  end

  def self.obtem_infos_lojista_cb
    endpoint = OpenStruct.new
    endpoint['id_lojista'] = API_DATA_PRODUTOS['produtos'][AMBIENTE][BANDEIRA]['lojista']['id']
    endpoint['nome_lojista'] = API_DATA_PRODUTOS['produtos'][AMBIENTE][BANDEIRA]['lojista']['nome']
    endpoint
  end

  def self.adiciona_dois_ou_mais_produtos_carrinho
    quantidade = rand(2..4)
    quantidade.times do
      @carrinho_produto = RequestProduto.obtem_infos_produto_cb
      Bff::Rest::Produto.new.post_produto(@carrinho_produto.body.to_h)
    end
    quantidade
  end
end
