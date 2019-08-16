class Autenticacao < SitePrism::Page
  element :bt_entrar, '#lnkCadastreSe'
  element :user, '#Email'
  element :pass, '#Senha'
  element :bt_confirmaLogin, '#btnClienteLogin'
  element :logado, '#lblLoginMsg'
  element :carrinho_logo,  '.ico-cart-header'
  element :link_remover, :xpath, '//a[@data-id="lnkRemover"]'
  element :qtd_itens, :xpath, '//div[@class="cart-header"]//div[@class="my-cart"]//span[@class="items-total"]'

  def click_login_page
    bt_entrar.click
  end

  def login_sucesso
    wait_until_el_displayed(:id, 'Email', 2)
    user.set 'nersa@nersa.com'
    pass.set '123456'
  end

  def click_login_confirma
    bt_confirmaLogin.click
  end

  def remove_produto
    carrinho_logo.hover
    @qtd_itens = qtd_itens.text

    unless @qtd_itens == '(0)'
      visit 'https://carrinho.pontofrio.com.br/'
      link_remover.click
      wait_until_el_displayed(:xpath, '//a[@class="bt btContinuar"]', 10)
      visit 'https://www.pontofrio.com.br/'
    end
  end
end
