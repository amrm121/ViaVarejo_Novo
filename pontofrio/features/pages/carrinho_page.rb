class Carrinho < SitePrism::Page
  element :click_produto, '.nm-product-img-container'
  element :bt_retira, '#ctl00_Conteudo_ctl27_btnRetirarNaLoja'  
  element :bt_concluir_end, '#btSelecionarPagamento2'
  element :bt_comprar_mais, '#btnComprarMaisProdutos'
  element :valida_loja_retira, '#IdLojaFisicaSelecionado'  
  element :check_garantia, :xpath, '//div[@class="extended-warranty"]//div[@class="plan-box option-01"]//span[@class="input-custom"]'
  element :check_seguro, :xpath, '//div[@class="keep-safe"]//div[@class="plan-box option-01"]//span[@class="input-custom"]'
  element :bt_concluir_compra, :xpath, '//div[@data-id="content"]//child::a[@data-isentregaincompativel="apenasRetira"]'  
  element :bt_continuar_compra, '#btnRetira'
  element :md_carrinho, :xpath, '//div[@data-id="content"]'
  element :bt_compra, '#btnAdicionarCarrinho'
  element :cp_cep_carrinho, '#Cep'
  element :bt_fluxo_conlcluir_compra, :xpath, '//div[@class="concluirCompra"]//child::a[@title="Concluir compra"]'
  element :bt_consultar_cep,  '#btnCalcularFrete'
  element :forma_entrega, '#lblFormaEntrega'
  element :checkbox_retira_rapido,  :xpath, "//p[@class='grp tEntrega pickup on']//child::input[@value='12']"
  element :cb_estado_retira, :xpath, "//select[@name='filtroLojaEstado']"
    element :opcao_estado_retira, :xpath, "//select[@name='filtroLojaEstado']//child::option[2]"
  element :cb_regiao_retira, :xpath, "//select[@name='filtroLojaRegiao']"
    element :opcao_regiao_retira, :xpath, "//select[@name='filtroLojaRegiao']//child::option[2]"
  element :cb_cidade_retira,  :xpath, "//select[@name='filtroLojaCidade']"
    element :opcao_cidade_retira, :xpath, "//select[@name='filtroLojaCidade']//child::option[2]"
  element :cb_bairro_retira, :xpath, "//select[@name='filtroLojaBairro']"
    element :opcao_bairro_retira, :xpath, "//select[@name='filtroLojaBairro']//child::option[2]"
    element :opcao1_bairro_retira, :xpath, "//select[@name='filtroLojaBairro']//child::option[1]"
  element :cp_informe_cep, '.maskCEP'
  element :bt_cacula_frete_prazo, '#btnCalculoFrete'
  element :txt_entrega_retira, '#ctl00_Conteudo_ctl31_rptTipoEntregaFrete_ctl03_lblEnderecoEntrega'
  element :txt_tempo_entrega, '#ctl00_Conteudo_ctl31_rptTipoEntregaFrete_ctl03_lblDeliveryTime'
  element :txt_frete_retira,'#ctl00_Conteudo_ctl31_rptTipoEntregaFrete_ctl03_lblValue'
  element :bt_mais_opcao, '#ctl00_Conteudo_ctl11_lnkMaisOpcoes'
  element :bt_retirar_lojista, '#ctl00_Conteudo_rptLojistas_ctl00_popRetirar'

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
    #bt_concluir_end.click

    wait_until_el_displayed(:xpath, '//div[@class="SubtituloPayment"]//child::p[@class="subtitulo"]', 10)
    @titulo_pagamento = find(:xpath, '//div[@class="SubtituloPayment"]//child::p[@class="subtitulo"]').text
    @result_titulo_pagamento = 'Escolha a melhor forma de pagamento'
  end

  def add_garantia_seguro
    check_garantia.click
    # check_seguro.click
  end

  def click_bt_compra
    wait_until_el_displayed(:id, 'btnAdicionarCarrinho', 5)
    bt_compra.click

  end

  def informa_cep_no_carrinho(cep)

    @get_title_button = first(:xpath, '//section[@id="sectionContent"]//h2').text

    if @get_title_button == "Muito mais proteção para os seus produtos!"
        first(:xpath, '//a[@data-id="btnContinuar"]').click
        wait_until_el_displayed(:xpath, '//div[@class="concluirCompra"]//child::a[@title="Concluir compra"]', seconds = 5)
        cp_cep_carrinho.set cep
        bt_consultar_cep.click
        wait_until_el_displayed(:xpath, '//div[@class="concluirCompra"]//child::a[@title="Concluir compra"]', seconds = 5)
        sleep 1
        page.execute_script('arguments[0].scrollIntoView();', bt_fluxo_conlcluir_compra)
        sleep 2
        bt_fluxo_conlcluir_compra.click      
    else 
        cp_cep_carrinho.set cep
        bt_consultar_cep.click
        wait_until_el_displayed(:xpath, '//div[@class="concluirCompra"]//child::a[@title="Concluir compra"]', seconds = 5)
        sleep 1
        page.execute_script('arguments[0].scrollIntoView();', bt_fluxo_conlcluir_compra)
        sleep 2
        bt_fluxo_conlcluir_compra.click
    end
  end

  def endereco_tela_valida_entrega_nao_retira
    wait_until_el_displayed(:id, 'btSelecionarPagamento2', 5)
    @formaEntrega = forma_entrega.text
    @formaEntrega != 'Retira Rápido'
  end

  def endereco_tela_seleciona_checkbox_retira    
    checkbox_retira_rapido.click    
    @formaEntregaRetira = forma_entrega.text
    @formaEntrega = 'Retira Rápido'
  end

  def endereco_tela_preencher_local_retira    
    wait_until_el_displayed(:xpath, "//select[@name='filtroLojaEstado']", 5)
    cb_estado_retira.click
    opcao_estado_retira.click
    wait_until_el_displayed(:xpath, "//select[@name='filtroLojaRegiao']", 5)
    cb_regiao_retira.click
    opcao_regiao_retira.click
    wait_until_el_displayed(:xpath, "//select[@name='filtroLojaCidade']", 5)
    cb_cidade_retira.click
    opcao_cidade_retira.click
    wait_until_el_displayed(:xpath, "//select[@name='filtroLojaBairro']", 5)
    cb_bairro_retira.click   
    @opcaoBairro = opcao1_bairro_retira.text
    
    if @opcaoBairro == 'Selecione'
      opcao_bairro_retira.click
    else
      opcao1_bairro_retira.click
    end
    
    $result_lojaRetira = valida_loja_retira.text
  end

  def detalheproduto_tela_pesquisa_cep(cep)
    cp_informe_cep.set cep
    bt_cacula_frete_prazo.click
  end
  
  def detalheproduto_tela_resultado_pesquisa_cep    
    wait_until_el_displayed(:xpath, "//tr[@class='shippingOptionGrp retira rápido']", 10)    
    $entrega_retira = txt_entrega_retira.text
    $tempo_retira = txt_tempo_entrega.text
    $frete_retira = txt_frete_retira.text
    $msg_entrega_retira = 'Retira Rápido'
    $msg_frete_retira = 'Grátis'
    $tempo_retira_tratado = $tempo_retira.gsub('A partir de ','Retire em ')
  end

  def detalheproduto_tela_botao_mais_opcao    
    bt_mais_opcao.click
  end

  def paginalojista_tela_botao_retirar    
    wait_until_el_displayed(:id, 'ctl00_Conteudo_rptLojistas_ctl00_popRetirar', 10)    
    bt_retirar_lojista.click
  end
end
