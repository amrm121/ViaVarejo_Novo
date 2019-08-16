class PesquisaProduto < SitePrism::Page

    set_url ''
    
    element :cp_pesquisa,                       '#strBusca'
    element :bt_busca,                          '#btnOK'
    
end