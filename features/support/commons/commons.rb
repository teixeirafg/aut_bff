module ApiCommons
  include HTTParty

  def gerar_token
    result = HTTParty.post(URL[BANDEIRA][AMBIENTE]['login'] + ENDPOINT['token'],
                           headers: { 'Content-Type' => 'application/json',
                                      'X-Device' => DISPOSITIVO },
                           body: { 'GrantType' => 'password',
                                   'Email' => API_DATA_USUARIOS['email_valido'][AMBIENTE][BANDEIRA]['email'],
                                   'Senha' => API_DATA_USUARIOS['email_valido'][AMBIENTE][BANDEIRA]['senha'] }.to_json)
    "Bearer #{result['accessToken']}"
  end
end
