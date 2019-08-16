Dado('que o usuário esteja na página home da bandeira') do
  visit CONFIG['url_padrao']
end

Dado('que o usuário acesse a página de Autenticação') do
  visit 'https://carrinho.extra.com.br/Checkout?ReturnUrl=https://www.extra.com.br#login'
end

Quando('informa dos dados da Autenticação') do
  autenticacao.login_sucesso
end

Quando('clica no botão confirmar') do
  autenticacao.click_login_confirma
end

Então('o usuário deve autenticar com sucesso na home') do
  @texto = find('#lblLoginMsg')
  expect(@texto.text).to eql 'Cliente'
  autenticacao.remove_produto
end
