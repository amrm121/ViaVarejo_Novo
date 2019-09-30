class PesquisaProduto < SitePrism::Page

    set_url ''
    
    element :cp_pesquisa,                       '.typeahead'
    element :bt_busca,          :xpath,          '//button[@class="bt ic-search"]'

    def pesquisa_tela_produto(produto)        
        cp_pesquisa.set produto
        bt_busca.click
    end
end