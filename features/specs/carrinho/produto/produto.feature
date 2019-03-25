#language:pt

@app-bff
@FullSmoke
@AppSquad
@bff_carrinho_produto
@ignoreDev @ignoreStg
Funcionalidade: BFF - Validar o endpoint de produto do carrinho
  Eu como usuário do sistema
  Quero que ao consultar a API de Carrinho
  De modo que seja retornado os valores corretamente.
  
  # Adiciona produto no carrinho
  @bff_carrinho_produto.post
  Esquema do Cenário: Validar o endpoint carrinho_produto.post
    Dado ter uma massa configurada do endpoint carrinho_produto.post para o cenário "<tipo>"
    Quando chamar o endpoint carrinho_produto.post
    Então validar o retorno do endpoint carrinho_produto.post para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |
  
  # Remove produto do carrinho
  @bff_carrinho_produto.delete
  Esquema do Cenário: Validar o endpoint carrinho_produto.delete
    Dado ter uma massa configurada do endpoint carrinho_produto.delete para o cenário "<tipo>"
    Quando chamar o endpoint carrinho_produto.delete
    Então validar o retorno do endpoint carrinho_produto.delete para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |
  
  # Atualiza quantidade de produtos no carrinho
  @bff_carrinho_produto.patch
  Esquema do Cenário: Validar o endpoint carrinho_produto.patch
    Dado ter uma massa configurada do endpoint carrinho_produto.patch para o cenário "<tipo>"
    Quando chamar o endpoint carrinho_produto.patch
    Então validar o retorno do endpoint carrinho_produto.patch para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |