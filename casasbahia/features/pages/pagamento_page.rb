class Pagamento < SitePrism::Page

    element :opcao_cartao,          :xpath,     '//li[@class="credit on"]'
    element :cp_cartao,                         '#NrCartao'    
    element :cp_dt_validade_mes,                '#DtValidadeMes'
      element :sl_dt_validade_mes,  :xpath,     '//select[@id="DtValidadeMes"]//child::option[11]'
    element :cp_dt_validade_ano,                '#DtValidadeAno'
      element :sl_dt_validade_ano,  :xpath,     '//select[@id="DtValidadeAno"]//child::option[4]'
    element :cp_nome_cartao,                    '#Nome'
    element :cp_cod_seguranca,                  '#NrSeguranca'
    element :cp_qtd_parcelas,                   '#QtdeParcelas'
    element :bt_concluir_compra,                '#btCredito'
    element :msg_compra_concluida,  :xpath,     '//div[@id="bannerPadding_1513173879"]//child::a[1][@style="text-decoration:none; color:#3DC359; font-size:30px; font-weight:normal; "]'    
    element :bt_fechar,             :xpath,     '//div[@id="WLbanner_1513173879"]//child::a[contains(text(),"×")]'
    element :msg_obg_carrinho,      :xpath,     '//h2[@ng-show="!compraFinalizadaCtrl.isReservaSite"]'
    element :cp_local_retirada,     :xpath,     '//td[@ng-bind="compraFinalizadaCtrl.ResumoCompra.Endereco.nomeDestinatario"]'

    
    def select_pagamento_cartao
        opcao_cartao.click      
        wait_until_el_displayed(:id, 'NrCartao', seconds = 5)
    end

        def preencher_dados_cartao
            sleep 02        
            cp_cartao.set           '5448923448597759'
            cp_dt_validade_mes.click
                sl_dt_validade_mes.click
            cp_dt_validade_ano.click
                sl_dt_validade_ano.click
            cp_nome_cartao.set      'Automação de Teste'
            cp_cod_seguranca.set    '691'  
            cp_qtd_parcelas.set     '5'
        end
    
    def confirmar_pagamento
        bt_concluir_compra.click
    end

    def wait_botao 
        wait_for_bt_fechar
    end

    def valida_conclusao_compra
        $msgCpConcluida = msg_compra_concluida.text        
        $resultmsgCpConcluida = 'Sua compra foi concluída!'                            
    end

    #def close_modal_compra           
    #    bt_fechar.click   
    #end

    def validar_carrinho_compra      
        wait_until_el_displayed(:xpath, '//h2[@ng-show="!compraFinalizadaCtrl.isReservaSite"]', seconds = 5)
        $msgObrigadoCarrinho = msg_obg_carrinho.text
        $resultMsgObrigadoCarrinho = 'Obrigado por comprar na CasasBahia.com.br'                 
    end

    def validar_localRetirada
        $localRetirada = cp_local_retirada.text
    end

end 