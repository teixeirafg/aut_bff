#language:pt

@app-bff
@FullSmoke
@AppSquad
@bff_carrinho
@ignoreDev @ignoreStg
Funcionalidade: BFF - Validar o endpoint de carrinho
  Eu como usuário do sistema
  Quero que ao consultar a API de Carrinho
  De modo que seja retornado os valores corretamente.
  
  # Obtém os dados do carrinho
  @bff_carrinho.get
  Esquema do Cenário: Validar o endpoint carrinho.get
    Dado ter uma massa configurada do endpoint carrinho.get para o cenário "<tipo>"
    Quando chamar o endpoint carrinho.get
    Então validar o retorno do endpoint carrinho.get para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |

  # Remove todos os produtos do carrinho
  @bff_carrinho.delete
  Esquema do Cenário: Validar o endpoint carrinho.delete
    Dado ter uma massa configurada do endpoint carrinho.delete para o cenário "<tipo>"
    Quando chamar o endpoint carrinho.delete
    Então validar o retorno do endpoint carrinho.delete para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |