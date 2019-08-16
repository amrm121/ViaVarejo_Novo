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
  carrinho.inserir_retira_cep
  expect(@msgretira).to eql @resultmsgretira
end

E('clica na loja que efetuar a retirada do produto') do
  carrinho.select_loja_cb
  expect(@msg_aguarde_email).to eql @result_msg_aguarde_email
  carrinho.obtem_loja_retira
end

E('clica no botão Retira no Local') do
  carrinho.click_retira_local
end

E('clica no botão Concluir compra') do
  sleep 2
  closepopup.tela_carrinho
  carrinho.confirmar_compra
  carrinho.valida_dados_entrega
  expect(@titulo_end_entrega).to eql @result_titulo_end_entrega
  expect(@forma_entrega).to eql @result_forma_entrega
  expect(@vl_frete).to eql @result_vl_frete
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
end
