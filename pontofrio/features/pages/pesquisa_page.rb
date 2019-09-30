class PesquisaProduto < SitePrism::Page

    set_url ''
    
    element :cp_pesquisa,                       '#strBusca'
    element :bt_busca,                          '#btnOK'
    
    def pesquisa_tela_produto(produto)        
        cp_pesquisa.set produto
        bt_busca.click
    end
end