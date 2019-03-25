#language:pt

@app-bff
@FullSmoke
@AppSquad
@departamento
@healthCheck
@ignoreDev @ignoreHlg @ignoreStg
Funcionalidade: BFF - Validar serviço Departamento
  Eu como usuário do sistema
  Quero que ao consultar a API de Departamento
  Sejam retornado os valores corretamente.

  @hc_departamento
  Cenário: Health Check - Retorno de GET da API de Departamento
    Dado  que envio uma requisição GET na API de Departamento
    Então status code retorna 200 na API de Departamento
