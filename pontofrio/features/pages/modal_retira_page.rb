class ModalRetira < SitePrism::Page
    element :cp_cep, :xpath, '//div[@class="input-buscal-modal"]//child::input[@name="cep"]'
    element :bt_LupaRetira, :xpath, '//div[@class="input-buscal-modal"]//child::input[@class="lupa-modal home"]'
    element :click_loja_cb, :xpath, '//img[@src="https://www.pontofrio-imagens.com.br/App_Themes/PontoFrio/img/retira-facil/logo/CasasBahia.png"]'
    element :loja_retira, '.detalhe-retirada-linha3-nome'
    element :bt_retira_local, :xpath, '//a[@title="Retirar neste local"]//child::span[1]'
    element :modalCep, '#TB_iframeContent'
    element :lista_resultado_loja, '.lista-resultado-estabelecimento'
    element :bt_lupa_busca_cep, '.lupa-modal'

    def inserir_retira_cep(cep)
      within_frame(modalCep) do
        cp_cep.set cep
        bt_LupaRetira.click
      end
    end

    def obtem_msg_retira
      within_frame(modalCep) do
        wait_until_el_displayed(:css, '.aviso-filtro', 5)
        @msgretira = find('.aviso-filtro').text
        @resultmsgretira = 'O prazo de liberação da retirada passará a contar a partir do e-mail de confirmação do pagamento, e condicionado ao horário de funcionamento do ponto de retirada. Você receberá as orientações por e-mail.'
      end
    end

    def select_loja_cb
      count = 0
      begin
        within_frame(modalCep) do
          first(:xpath, '//img[@src="https://www.pontofrio-imagens.com.br/App_Themes/PontoFrio/img/retira-facil/logo/CasasBahia.png"]').click
        end
      rescue Capybara::ElementNotFound
        within_frame(modalCep) do
          bt_lupa_busca_cep.click
        end
          count += 1
          count < 3 ? retry : raise('Lojas nao listadas no modal retira rapido')      
      end  
    end

    def obtem_loja_retira
        within_frame(modalCep) do            
          wait_until_el_displayed(:xpath, '//a[@title="Retirar neste local"]//child::span[1]', 5)
          @msg_aguarde_email = find('.detalhe-retirada-linha2-aviso-email').text
          @result_msg_aguarde_email = 'Aguarde o e-mail com o nosso aviso que o produto esta pronto para retirada e verifique o horário de funcionamento do local escolhido abaixo.'
          $lojaRetira = loja_retira.text
          $result_lojaRetira = $lojaRetira
        end
    end

    def click_retira_local    
        within_frame(modalCep) do
            bt_retira_local.click
        end
    end

    def select_loja_especifica(loja)
      within_frame(modalCep) do                
        find(:xpath, "//ul[@class='lista-resultado-estabelecimento']//span[contains(text(), '#{loja}')]").click
        $loja_click = loja                
      end  
    end

    def lista_lojas_depara_pesquisas            
      within_frame(modalCep) do        
        $retorno_lista_resultado_loja = lista_resultado_loja.text
      end
    end
end
