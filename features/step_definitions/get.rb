Dado(/^que eu informe uma URl com CEP Válido$/) do
  @CEP = ENV['CEP_VALIDO']
  @response = HTTParty.get("http://correiosapi.apphb.com/cep/#{@CEP}")
end
Quando(/^o Codigo de resposta é 200$/) do
  puts "RESPOSTA DO SERVIDOR: #{@response.code}"
end
Entao(/^o retorno serão os dados do endereço$/) do
  body = JSON.parse(@response.body)
  puts "CEP: "+body["cep"]
  puts body["tipoDeLogradouro"]+": "+body["logradouro"]
  puts "Bairro: "+body["bairro"]
  puts "Cidade: "+body["cidade"]
  puts "Estado: "+body["estado"]
end

Dado(/^que eu informe uma URl com CEP Inválido$/) do
  @CEP = ENV['CEP_INVALIDO']
  @response = HTTParty.get("http://correiosapi.apphb.com/cep/#{@CEP}")
end
Quando(/^o Codigo de resposta é 404$/) do
  puts "RESPOSTA DO SERVIDOR: #{@response.code}"
end
Entao(/^o retorno será uma mensagem$/) do
  body = JSON.parse(@response.body)
  puts "Mensagem: "+body["message"]
end
