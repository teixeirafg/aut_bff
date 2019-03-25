Dado('que envio uma requisição GET na API de Banners') do
  @response_banners = banners.get_banners
end

Quando('a API de Banners retorna status {int}') do |code|
  expect(@response_banners.code).to eql code
end

Então('valido o atributo corDeFundo da API de Banners') do
  @response_banners.each_with_index do |bloco, index|
    expect(bloco['corDeFundo']).not_to be_empty, 'Campo deveria existir e vir populado, verifique o log da API'
    puts "Posição do bloco: #{index}, conteúdo: #{bloco['corDeFundo']}"
  end
end
