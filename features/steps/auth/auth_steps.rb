Dado('ter uma massa configurada do endpoint token.post para o cenário {string}') do |tipo|
  @token_post = tipo.eql?('positivo') ? RequestLogin.request_login_valido : RequestLogin.request_request_login_senha_invalida
end

Quando('chamar o endpoint token.post') do
  @token_post ||= OpenStruct.new
  begin
    @token_post.response = auth.post_auth(@token_post.body.to_h)
  rescue StandardError => error
    @token_post.error = error
  end
end

Então('validar o retorno do endpoint token.post para o cenário {string}') do |tipo|
  endpoint = @token_post
  expect(endpoint.error).to be_nil
  if tipo.eql?('positivo')
    expect(endpoint.response['email']).to eql(endpoint.body['Email']), 'Email não confere com o esperado'
    endpoint.response.each { |_key, value| expect(value).not_to be_nil }
  else
    expect(endpoint.response['erros'][0]['campo']).to eql 'Senha'
    expect(endpoint.response['erros'][1]['campo']).to eql 'Email'
    expect(endpoint.response['erros'][0]['mensagem']).to eql 'E-mail ou senha incorretos.'
    expect(endpoint.response['erros'][1]['mensagem']).to eql 'E-mail ou senha incorretos.'
    expect(endpoint.response['mensagem']).to eql 'Existem erros no request.'
  end
end
