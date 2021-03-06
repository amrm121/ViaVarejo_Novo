class ClosePopup < SitePrism::Page

element :esc_one,               '#ctl00_home'
element :esc_two,               '.vitrine-resultado'
element :esc_tree,  :xpath,     '//html[@lang="pt-br"]'
element :esc_four,  :xpath,     '//html[@lang="en"]'    

    set_url ''

    def tela_busca
        esc_one.send_keys(:escape)
    end

    def tela_busca_resultado
        esc_two.send_keys(:escape)
    end

    def tela_carrinho
        esc_tree.send_keys(:escape)
    end

    def tela_compra_concluida
        esc_four.send_keys(:escape)
    end        



end