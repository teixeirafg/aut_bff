#language:pt

@app-bff
@FullSmoke
@AppSquad
@banners
@ignoreDev @ignoreHlg @ignoreStg
Funcionalidade: BFF - Validar atributos de Banners
  Eu como usuário do App
  Quero que as informações de Banners
  Sejam apresentadas corretamente após correções feitas.

  @hotfix_banners
  Cenário: HotFix - Validar a cor de fundo com a API de Banners
    Dado que envio uma requisição GET na API de Banners
    Quando a API de Banners retorna status 200
    Então valido o atributo corDeFundo da API de Banners