#language:pt

@app-bff
@FullSmoke
@AppSquad
@bff_carrinho_produto_quantidade
@ignoreDev @ignoreStg
Funcionalidade: BFF - Validar o endpoint de produto do carrinho
  Eu como usuário do sistema
  Quero que ao consultar a API de Carrinho
  De modo que seja retornado os valores corretamente.
  
  # Obtém quantidade de produtos no carrinho
  @bff_carrinho_produto_quantidade.get
  Esquema do Cenário: Validar o endpoint bff_carrinho_produto_quantidade.get
    Dado ter uma massa configurada do endpoint bff_carrinho_produto_quantidade.get para o cenário "<tipo>"
    Quando chamar o endpoint bff_carrinho_produto_quantidade.get
    Então validar o retorno do endpoint bff_carrinho_produto_quantidade.get para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |