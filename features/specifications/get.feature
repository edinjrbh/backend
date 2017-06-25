#language: pt

Funcionalidade: Consultar CEP

Como usuário desejo verificar se os CEP's informados são validos.

Cenario:Consultando CEP Válido

  Dado que eu informe uma URl com CEP Válido
  Quando o Codigo de resposta é 200
  Entao o retorno serão os dados do endereço

Cenario:Consultando CEP Inválido

  Dado que eu informe uma URl com CEP Inválido
  Quando o Codigo de resposta é 404
  Entao o retorno será uma mensagem
