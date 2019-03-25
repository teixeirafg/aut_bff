Quando('chamar o endpoint captcha.get') do
  @captcha_get ||= OpenStruct.new
  begin
    @captcha_get.response = captcha.get_captcha
  rescue StandardError => error
    @captcha_get.error = error
  end
end

Então('validar o retorno do endpoint captcha.get para o cenário {string}') do |_tipo|
  endpoint = @captcha_get
  expect(endpoint.error).to be_nil
  endpoint.response.each { |_key, value| expect(value).not_to be_nil }
end
