Quando('pesquisa pelo {string} no modal retira') do |cep|    
    modalretira.inserir_retira_cep(cep)
end

E('clico na {string}') do |loja|    
    modalretira.select_loja_especifica(loja)
end

E('valido se a loja apresentada e a mesma que cliquei') do       
    modalretira.obtem_loja_retira    
    expect($lojaRetira).to eql $loja_click
end