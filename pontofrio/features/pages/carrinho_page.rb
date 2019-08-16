class Carrinho < SitePrism::Page
  element :click_produto, '.nm-product-img-container'
  element :bt_retira, '#ctl00_Conteudo_ctl27_btnRetirarNaLoja'
  element :loja_retira, '.detalhe-retirada-linha3-nome'
  element :bt_concluir_end, '#btSelecionarPagamento2'
  element :bt_comprar_mais, '#btnComprarMaisProdutos'
  element :valida_loja_retira, '#IdLojaFisicaSelecionado'
  element :modalCep, '#TB_iframeContent'
  element :check_garantia, :xpath, '//div[@class="extended-warranty"]//div[@class="plan-box option-01"]//span[@class="input-custom"]'
  element :check_seguro, :xpath, '//div[@class="keep-safe"]//div[@class="plan-box option-01"]//span[@class="input-custom"]'
  element :bt_concluir_compra, :xpath, '//div[@data-id="content"]//child::a[@data-isentregaincompativel="apenasRetira"]'
  element :bt_retira_local, :xpath, '//a[@title="Retirar neste local"]//child::span[1]'
  element :bt_continuar_compra, '#btnRetira'
  element :md_carrinho, :xpath, '//div[@data-id="content"]'
  element :cp_cep, :xpath, '//div[@class="input-buscal-modal"]//child::input[@name="cep"]'
  element :bt_LupaRetira, :xpath, '//div[@class="input-buscal-modal"]//child::input[@class="lupa-modal home"]'
  element :click_loja_cb, :xpath, '//img[@src="https://www.pontofrio-imagens.com.br/App_Themes/PontoFrio/img/retira-facil/logo/CasasBahia.png"]'

  def obter_produto
    wait_until_el_displayed(:css, '.nm-search-results-container', 5)
    first(:css, '.nm-product-img-container').click
  end

  def click_bt_retira
    wait_until_el_displayed(:id, 'ctl00_Conteudo_ctl27_btnRetirarNaLoja', 5)
    bt_retira.click
  end

  def obtem_titulo_informa_cep
    @titulo_inf_cep = find(:xpath, "//div[@class ='chamada-modal']").text
    @result_titulo_cep = 'Informe o CEP desejado e consulte nossos Pontos de Retirada mais próximos'
  end

  def inserir_retira_cep
    within_frame(modalCep) do
      cp_cep.set('08040000')
      bt_LupaRetira.click
    end
  end

  def obtem_msg_retira
    within_frame(modalCep) do
      wait_until_el_displayed(:css, '.aviso-filtro', 5)
      @msgretira = find('.aviso-filtro').text
      @resultmsgretira = 'O prazo de liberação da retirada passará a contar a partir do e-mail de confirmação do pagamento, e condicionado ao horário de funcionamento do ponto de retirada. Você receberá as orientações por e-mail.'
    end
  end

  def select_loja_cb
    within_frame(modalCep) do
      first(:xpath, '//img[@src="https://www.pontofrio-imagens.com.br/App_Themes/PontoFrio/img/retira-facil/logo/CasasBahia.png"]').click
    end
  end

  def obtem_loja_retira
    within_frame(modalCep) do
      wait_until_el_displayed(:xpath, '//a[@title="Retirar neste local"]//child::span[1]', 5)
      @msg_aguarde_email = find('.detalhe-retirada-linha2-aviso-email').text
      @result_msg_aguarde_email = 'Aguarde o e-mail com o nosso aviso que o produto esta pronto para retirada e verifique o horário de funcionamento do local escolhido abaixo.'
      $lojaRetira = loja_retira.text
      $result_lojaRetira = $lojaRetira
    end
  end

  def click_retira_local
    within_frame(modalCep) do
      bt_retira_local.click
    end
  end

  def click_continuar_compra
    if page.has_selector?(:id, 'TB_iframeContent')
      within_frame(modalCep) do
        bt_continuar_compra.click
      end
    end
  end

  def confirmar_compra
    @get_title_button = first(:xpath, '//section[@id="sectionContent"]//h2').text
    if @get_title_button == 'Muito mais proteção para os seus produtos!'
      first(:xpath, '//a[@data-id="btnContinuar"]').click
      wait_until_el_displayed(:xpath, '//div[@data-id="content"]//child::a[@data-isentregaincompativel="apenasRetira"]', 5)
    end
    bt_concluir_compra.click
  end

  def valida_dados_entrega
    wait_until_el_displayed(:id, 'btSelecionarPagamento2', 5)
    @titulo_end_entrega = find(:xpath, "//label[@data-id='lblEnderecoEntrega']").text
    @result_titulo_end_entrega = 'Endereço de cobrança'
    @forma_entrega = find('#lblFormaEntrega').text
    @result_forma_entrega = 'Retira Rápido'
    @vl_frete = find(:xpath, '//label[@data-id="frete"]').text
    @result_vl_frete = 'R$ 0,00'
  end

  def endereco_tela_valida_loja_retira
    $confirma_loja_retira = valida_loja_retira.text
  end

  def confirma_endereco
    sleep 1
    page.execute_script('arguments[0].scrollIntoView();', bt_concluir_end)
    sleep 2      
    bt_concluir_end.click

    wait_until_el_displayed(:xpath, '//div[@class="SubtituloPayment"]//child::p[@class="subtitulo"]', 10)
    @titulo_pagamento = find(:xpath, '//div[@class="SubtituloPayment"]//child::p[@class="subtitulo"]').text
    @result_titulo_pagamento = 'Escolha a melhor forma de pagamento'
  end

  def add_garantia_seguro
    check_garantia.click
    # check_seguro.click
  end
end
