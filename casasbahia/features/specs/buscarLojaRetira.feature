#language: pt

@compra_com_retira
Funcionalidade: Buscar loja Retira
  Eu como usuário desejo
  realizar buscas de lojas no site através
  do modulo de entrega retira rápido.
  
  Contexto: que o usuário esteja logado
    #Dado que o usuario esteja na página home da bandeira
    Dado que o usuario esteja logado na home da bandeira

    @teste
    Esquema do Cenario: Validar se a loja está sendo apresentada para o sku consultado
    Quando busco pelo o "<produto>"
    Então levo o sku retira com o "<cep>" até o modal que confirma a retirada no local   

    Exemplos:
        |produto    |cep        |                
        |14971368   |'04801000' |
        
@alterar_compra_normal_para_retira_validacao
  Esquema do Cenario: Alterar comprar normal para retira
    Quando busco pelo o "<produto>"
    E levo o sku até a tela de Endereço através do fluxo de compra informando o "<cep>"
    E altero a forma de entrega para a opção Retira '<estado>' '<regiao>' '<cidade>' '<bairro>' '<loja>'
    Então verifica que o tempo de retirada do produto na loja e de '<tempo_de_retirada>'

    Exemplos:
      |produto  |cep       |estado  |regiao    |cidade   |bairro        |loja                                 |tempo_de_retirada  |
      |13400014 |'13215276'|SP      |São Paulo |Jundiaí  |VL. RIO BRANCO|PontoFrio - Shopping Maxi Jundiaí 2  |Em 2h*             |