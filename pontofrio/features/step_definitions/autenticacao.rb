Dado('que o usuário esteja na página home da bandeira') do
  visit CONFIG['url_padrao']
end

Dado('que o usuário acesse a página de Autenticação') do
  visit 'https://carrinho.pontofrio.com.br/Checkout?ReturnUrl=https://www.pontofrio.com.br#login'
end

Quando('informa dos dados da Autenticação') do
  autenticacao.login_sucesso
end

Quando('clica no botão confirmar') do
  autenticacao.click_login_confirma
  sleep 2
  closepopup.tela_busca
end

Então('o usuário deve autenticar com sucesso na home') do
  @texto = find('#lblLoginMsg')
  expect(@texto.text).to eql 'Olá nersa'
  autenticacao.remove_produto
  closepopup.tela_busca
end
