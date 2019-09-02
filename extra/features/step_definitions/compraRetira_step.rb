Dado('que o usuario esteja logado na home da bandeira') do
  step 'que o usuário esteja na página home da bandeira'
  step 'que o usuário acesse a página de Autenticação'
  step 'informa dos dados da Autenticação'
  step 'clica no botão confirmar'
  step 'o usuário deve autenticar com sucesso na home'
end

Quando('busco pelo o {string}') do |produto|
  sleep 2
  closepopup.tela_busca
  pesquisa.cp_pesquisa.set produto
  pesquisa.bt_busca.click
end

Quando('levo o sku retira com o {string} até a página de pagamento') do |cep|
  step 'o usuario seleciona um produto no retorno da pesquisa'
  step 'clica no botão Retira Rápido'
  within_frame(carrinho.modalCep) do
    carrinho.cp_cep.set cep
    carrinho.bt_LupaRetira.click
  end
  step 'clica na loja que efetuar a retirada do produto'
  step 'clica no botão Retira no Local'
  step 'clica no botão Concluir compra'
  step 'confirmar o endereço pressionando o botão Concluir'
end

Quando('finalizo a compra') do
  step 'preenche os dados do cartão'
  step 'confirma os dados pressionando o botão concluir'
end

Então('confirmo que o número do pedido foi apresentado') do
  step 'valida se a compra foi realizada com sucesso'
end

Quando('escolho o produto solicitando retirada no {string}') do |cep|
  step 'o usuario seleciona um produto no retorno da pesquisa'
  step 'clica no botão Retira Rápido'
  within_frame(carrinho.modalCep) do
    carrinho.cp_cep.set cep
    carrinho.bt_LupaRetira.click
  end
  step 'clica na loja que efetuar a retirada do produto'
  step 'clica no botão Retira no Local'
end

Quando('adiciono garantia e seguro para o produto') do
  step 'adiciona os seguros'
end

Quando('levo o produto até a página de pagamento') do
  step 'clica no botão Concluir compra com garantia e seguro'
  step 'confirmar o endereço pressionando o botão Concluir'
end

Quando('levo o sku retira com o {string} e {string} até a página de pagamento') do |cep, loja|
  step 'o usuario seleciona um produto no retorno da pesquisa'
  step 'clica no botão Retira Rápido'
  within_frame(carrinho.modalCep) do
    carrinho.cp_cep.set cep
    carrinho.bt_LupaRetira.click
  end

  within_frame(carrinho.modalCep) do
    find(:xpath, "//ul[@class='lista-resultado-estabelecimento']//span[contains(text(), '#{loja}')]").click
    expect(@msg_aguarde_email).to eql @result_msg_aguarde_email
  end
  carrinho.obtem_loja_retira
  step 'clica no botão Retira no Local'
  step 'clica no botão Concluir compra'
  step 'confirmar o endereço pressionando o botão Concluir'
end

Quando('levo o sku até a tela de Endereço através do fluxo de compra informando o {string}') do |cep|
  step 'o usuario seleciona um produto no retorno da pesquisa'  
  step 'clica no botao Comprar'  
  step "informa o #{cep} na tela do carrinho"
  step 'verifico que estou na tela de Endereço com opção de Entrega diferente do retira'
end

Quando('altero a forma de entrega para a opção Retira') do  
  step 'altero a opcao de entrega para retira'
  step 'seleciona os combos do retira rápido'
end