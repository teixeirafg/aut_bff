Dado('que envio uma requisição GET na API de Departamento') do
  @departamento = departamento.get_departamento
end

Dado('status code retorna {int} na API de Departamento') do |status_code|
  expect(@departamento.code).to eq(status_code), 'Bad Request'
end
