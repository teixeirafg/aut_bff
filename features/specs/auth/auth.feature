#language:pt

@app-bff
@FullSmoke
@AppSquad
@bff_token
@ignoreDev @ignoreStg
Funcionalidade: BFF - Validar o endpoint de token
  Eu como usuário do sistema
  Quero que ao consultar a API de Auth
  De modo que seja retornado os valores corretamente.

  # Cria o token para acesso as requisões no BFF
  @bff_token.post
  Esquema do Cenário: Validar o endpoint token.post
    Dado ter uma massa configurada do endpoint token.post para o cenário "<tipo>"
    Quando chamar o endpoint token.post
    Então validar o retorno do endpoint token.post para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |