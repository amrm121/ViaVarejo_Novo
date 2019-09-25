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
  step "pesquisa pelo '#{cep}' no modal retira"
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
  step "pesquisa pelo '#{cep}' no modal retira"
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
  step "pesquisa pelo #{cep} no modal retira"  
  step "clico na '#{loja}'"
  step 'valido se a loja apresentada e a mesma que cliquei'
  step 'clica no botão Retira no Local'
  step 'clica no botão Concluir compra'
  step 'confirmar o endereço pressionando o botão Concluir'
end

Quando('levo o sku até a tela de Endereço através do fluxo de compra informando o {string}') do |cep|
  step 'o usuario seleciona um produto no retorno da pesquisa'  
  step 'clica no botao Comprar'
  step "informa o '#{cep}' na tela do carrinho"
  step 'verifico que estou na tela de Endereço com opção de Entrega diferente do retira'
end

Quando('altero a forma de entrega para a opção Retira') do  
  step 'altero a opcao de entrega para retira'
  step 'seleciona os combos do retira rápido'
end

Dado('que o usuario esteja na página home da bandeira') do
  step 'que o usuário esteja na página home da bandeira'
end

Então('levo o sku retira com o {string} até o modal que confirma a retirada no local') do |cep|
  step 'o usuario seleciona um produto no retorno da pesquisa'  
  step 'clica no botão Retira Rápido'  
  
  within_frame(modalretira.modalCep) do
    modalretira.cp_cep.set cep
    modalretira.bt_LupaRetira.click    
    find(:xpath, "//a[@href='javascript:void(0);']//strong[contains(text(), '840 m')]").click
    sleep 1
    @loja = find('.detalhe-retirada-linha3-nome').text
    @lojaclick = 'Casas Bahia - Cidade Dutra'    
    expect(@loja).to eql @lojaclick
  end    
  puts  "Loja Encontrada'"
end


Quando('calculo o frete com prazo de entrega informando o {string}') do |cep|
  step 'o usuario seleciona um produto no retorno da pesquisa'  
  step "pesquisa o '#{cep}' no campo Informe seu Cep"  
  step 'valida se existe o Retira Rapido no retorno da pesquisa'
end  

Quando("em seguida efetuo uma busca do mesmo sku no modal retira informando o mesmo {string}") do |cep|
  step 'clica no botão Retira Rápido'
  step "pesquisa pelo '#{cep}' no modal retira"
end                                                                            
                                                                               
Então('as informação de quantidade de horas do modal retira devem corresponde com o do calcula frete e prazo') do
  modalretira.lista_lojas_depara_pesquisas
  expect($retorno_lista_resultado_loja).to have_text($tempo_retira_tratado)  
end                                                                            