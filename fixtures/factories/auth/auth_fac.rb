include Utils

class RequestLogin
  def self.request_login_valido
    endpoint = OpenStruct.new
    endpoint.body = OpenStruct.new
    endpoint.body['GrantType'] = 'password'
    endpoint.body['Email'] = API_DATA_USUARIOS['email_valido'][AMBIENTE][BANDEIRA]['email']
    endpoint.body['Senha'] = API_DATA_USUARIOS['email_valido'][AMBIENTE][BANDEIRA]['senha']
    endpoint
  end

  def self.request_request_login_senha_invalida
    endpoint = request_login_valido
    endpoint.body['Senha'] = API_DATA_USUARIOS['email_invalido'][AMBIENTE][BANDEIRA]['senha']
    endpoint
  end
end
