#language: pt

@autenticacao_usuario
Funcionalidade: Autenticação de usuários
  Eu como usuário do site
  quero poder me autenticar com sucesso
  para realizar e acompanhar compras no futuro.

  Contexto: que o usuário esteja logado
  Dado que o usuário esteja na página home da bandeira

  @login_sucesso
  Cenário: Autenticação com sucesso
    Dado que o usuário acesse a página de Autenticação
    Quando informa dos dados da Autenticação
    E clica no botão confirmar
    Então o usuário deve autenticar com sucesso na home
