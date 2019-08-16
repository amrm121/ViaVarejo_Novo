class Autenticacao < SitePrism::Page
  element :bt_entrar, '#lnkCadastreSe'
  element :user, '#Email'
  element :pass, '#Senha'
  element :bt_confirmaLogin, '#btnClienteLogin'
  element :logado, '#lblLoginMsg'
  element :link_remover, :xpath, '//a[@data-id="lnkRemover"]'
  # element :status_cestaVazia, '.cestaVazia'
  element :qtd_carrinho, '#itensCarrinho'

  def click_login_page
    bt_entrar.click
  end

  def login_sucesso
    wait_until_el_displayed(:id, 'Email', 2)
    user.set    'user_automacao03112014_090638117@cnova.com'
    pass.set    '123456'
  end

  def click_login_confirma
    bt_confirmaLogin.click
  end

  def remove_produto
    # carrinho_logo.hover
    @qtd_carrinho = qtd_carrinho.text

    unless @qtd_carrinho == ''
      visit 'https://carrinho.casasbahia.com.br/'
      link_remover.click            
      wait_until_el_displayed(:xpath, '//a[@class="bt btContinuar"]', 10)
      visit 'https://www.casasbahia.com.br/' 
    end
  end
end
