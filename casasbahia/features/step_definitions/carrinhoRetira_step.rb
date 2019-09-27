Quando('o usuario seleciona um produto no retorno da pesquisa') do
  sleep 2 
  closepopup.tela_busca_resultado
  carrinho.obter_produto
end

E('clica no botão Retira Rápido') do
  sleep 2
  closepopup.tela_busca
  carrinho.click_bt_retira
  expect(@titulo_inf_cep).to eql @result_titulo_cep
end

E('informa o cep e confirma') do
  modalretira.inserir_retira_cep
  expect(@msgretira).to eql @resultmsgretira
end

E('clica na loja que efetuar a retirada do produto') do
  modalretira.select_loja_cb  
  modalretira.obtem_loja_retira
  expect(@msg_aguarde_email).to eql @result_msg_aguarde_email
end

E('clica no botão Retira no Local') do
  modalretira.click_retira_local
end

E('clica no botão Concluir compra') do
  sleep 2
  closepopup.tela_carrinho
  carrinho.confirmar_compra
  carrinho.valida_dados_entrega
  expect(@titulo_end_entrega).to eql @result_titulo_end_entrega
  expect(@forma_entrega).to eql @result_forma_entrega
  expect(@vl_frete).to eql @result_vl_frete
  carrinho.endereco_tela_valida_loja_retira
  expect($lojaRetira).to eql $confirma_loja_retira
end

E('confirmar o endereço pressionando o botão Concluir') do
  carrinho.confirma_endereco
  expect(@titulo_pagamento).to eql @result_titulo_pagamento
end

E('adiciona os seguros') do
  sleep 2
  closepopup.tela_carrinho
  carrinho.add_garantia_seguro
end

E('clica no botão Concluir compra com garantia e seguro') do
  carrinho.confirmar_compra
  carrinho.valida_dados_entrega
  expect(@titulo_end_entrega).to eql @result_titulo_end_entrega
  expect(@forma_entrega).to eql @result_forma_entrega
  expect(@vl_frete).to eql @result_vl_frete
  expect(@loja_retira).to eql @confirmaLojaRetira
end

E('clica no botao Comprar') do
  sleep 2
  closepopup.tela_busca
  carrinho.click_bt_compra  
end

E('informa o {string} na tela do carrinho') do |cep|
  carrinho.informa_cep_no_carrinho(cep)
end

E('verifico que estou na tela de Endereço com opção de Entrega diferente do retira') do  
  carrinho.endereco_tela_valida_entrega_nao_retira
end

E('altero a opcao de entrega para retira') do  
  carrinho.endereco_tela_seleciona_checkbox_retira
end

E('seleciona os combos do retira rápido') do
  carrinho.endereco_tela_preencher_local_retira
  carrinho.confirma_endereco
end

E('pesquisa o {string} no campo Informe seu Cep') do |cep| 
  closepopup.tela_busca 
  carrinho.detalheproduto_tela_pesquisa_cep(cep)
end

E('valida se existe o Retira Rapido no retorno da pesquisa') do
  sleep 2
  closepopup.tela_busca   
  carrinho.detalheproduto_tela_resultado_pesquisa_cep
  expect($entrega_retira).to eql $msg_entrega_retira
  expect($frete_retira).to eql $msg_frete_retira
end

E('clica no botão + opções') do
  closepopup.tela_busca
  carrinho.detalheproduto_tela_botao_mais_opcao
end

E('na pagina do lojista clica no botao Retirar') do
  closepopup.tela_busca  
  carrinho.paginalojista_tela_botao_retirar
end