Dado('que o usuário esteja na página home da bandeira') do  
  visit CONFIG['url_padrao']
end

Dado('que o usuário acesse a página de Autenticação') do
  autenticacao.click_login_page
end

Quando('informa dos dados da Autenticação') do
  autenticacao.login_sucesso
end

Quando('clica no botão confirmar') do
  autenticacao.click_login_confirma
end

Então('o usuário deve autenticar com sucesso na home') do
  @texto = find('#lblLoginMsg')
  expect(@texto.text).to eql 'Olá ,Cliente'
  autenticacao.remove_produto
end
