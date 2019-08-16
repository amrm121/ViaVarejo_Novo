class PesquisaProduto < SitePrism::Page

    set_url ''
    
    element :cp_pesquisa,                       '.typeahead'
    element :bt_busca,          :xpath,          '//button[@class="bt ic-search"]'

end