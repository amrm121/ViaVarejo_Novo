Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module Pages
  def autenticacao
    @autenticacao ||= Autenticacao.new
  end

  def pesquisa
    @pesquisa ||= PesquisaProduto.new
  end

  def carrinho
    @carrinho ||= Carrinho.new
  end

  def pagamento
    @pagamento ||= Pagamento.new
  end

  def closepopup
    @closepopup ||= ClosePopup.new
  end
end
