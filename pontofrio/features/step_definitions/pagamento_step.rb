Quando('preenche os dados do cartão')  do
  # pagamento.select_pagamento_cartao
  pagamento.preencher_dados_cartao
end

E('confirma os dados pressionando o botão concluir') do
  pagamento.confirmar_pagamento
end

E('valida se a compra foi realizada com sucesso') do
  sleep 3
  closepopup.tela_carrinho  
  pagamento.validar_carrinho_compra
  expect($msgObrigadoCarrinho).to eql $resultMsgObrigadoCarrinho
  pagamento.validar_localRetirada
  binding.pry
  expect($result_lojaRetira).to eql $localRetirada
end
