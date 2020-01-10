class Autenticacao < SitePrism::Page
  element :bt_entrar, '#lnkCadastreSe'
  element :user, '#Email'
  element :pass, '#Senha'
  element :bt_confirmaLogin, '#btnClienteLogin'
  element :logado, '#lblLoginMsg'
  element :link_remover, :xpath, '//a[@data-id="lnkRemover"]'
  element :qtd_carrinho, '#itensCarrinho'

  def click_login_page
    bt_entrar.click
  end

  def login_sucesso
    wait_until_el_displayed(:id, 'Email', 2)
    #binding.pry
    #ChromeSessionConfiguration.new(page.driver).prevent_request
    wait_until_el_displayed(:id, 'Email', 2)
    user.set    'user_automacao03112014_090635262@cnova.com'
    pass.set    '123456'
  end

  def click_login_confirma        
    bt_confirmaLogin.click
    #binding.pry
    #ChromeSessionConfiguration.new(page.driver).allow_requests
  end

  def remove_produto
    # carrinho_logo.hover
    @qtd_carrinho = qtd_carrinho.text

    unless @qtd_carrinho == ''
      visit 'https://carrinho.casasbahia.com.br/'
      count = 0
      first(:xpath, '//a[@data-id="lnkRemover"]').click      
      begin        
        wait_until_el_displayed(:xpath, '//a[@class="bt btContinuar"]', seconds = 2)
      rescue  Capybara::ElementNotFound
        first(:xpath, '//a[@data-id="lnkRemover"]').click
        count += 1
        count < 3 ? retry : raise('produto removido do carrinho')        
      end     
      visit 'https://www.casasbahia.com.br/' 
    end
  end
end
