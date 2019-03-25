#language:pt

@app-bff
@FullSmoke
@AppSquad
@bff_captcha
@ignoreDev @ignoreStg
Funcionalidade: BFF - Validar o endpoint de captcha
  Eu como usuário do sistema
  Quero que ao consultar a API de Auth
  De modo que seja retornado os valores corretamente.

  # Obtem a imagem e id de captcha
  @bff_captcha.get
  Esquema do Cenário: Validar o endpoint captcha.get
    Quando  chamar o endpoint captcha.get
    Então validar o retorno do endpoint captcha.get para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |