# language: pt

@compra_com_retira
Funcionalidade: Compra pelo o Retira
  Eu como usuário desejo
  realizar compras no site através
  do modulo de entrega retira rápido.

  Contexto: que o usuário esteja logado
    Dado que o usuario esteja logado na home da bandeira

  @realizar_compra_retira
  Esquema do Cenario: Realizar Compra Retira
    Quando busco pelo o "<produto>"
    E levo o sku retira com o "<cep>" até a página de pagamento
    E finalizo a compra
    Então confirmo que o número do pedido foi apresentado 

    Exemplos:
      | produto  | cep      | 
      | 12639587 | 08040000 |
      | 11779520 | 09181140 |
      | 12369338 | 09520900 |

  @realizar_compra_retira_com_seguro 
  Esquema do Cenario: Realizar Compra Retira com seguros
    Quando busco pelo o "<produto>" 
    E escolho o produto solicitando retirada no "<cep>"
    E adiciono garantia e seguro para o produto
    E levo o produto até a página de pagamento    
    E finalizo a compra
    Então confirmo que o número do pedido foi apresentado

    Exemplos:
      | produto   | cep      | 
      | 12369338  | 09520900 |
      
  @realizar_compra_retira_com_loja_especifica    
  Esquema do Cenario: Realizar Compra Retira com loja especifica
    Quando busco pelo o "<produto>"
    E levo o sku retira com o "<cep>" e "<loja>" até a página de pagamento
    E finalizo a compra
    Então confirmo que o número do pedido foi apresentado 

    Exemplos:
      | produto | cep       | loja                                          |
      #|15023008	|'02611002'	|Casas Bahia - Nova Cachoeirinha                |
      #|2275	    |'02739000'	|Casas Bahia - Vila Nova Cachoeirinha           |
      #|15077085	|'02611002'	|Casas Bahia - Nova Cachoeirinha                |
      #|11795154	|'02936000'	|Casas Bahia - Pirituba                         |
      #|22238	  |'03001000'	|Casas Bahia - Brás                             |
      #|12662029	|'03066030'	|Casas Bahia - Shopping Metrô Boulevard Tatuapé |
      #|4451562	|'13318000'	|Casas Bahia - Cabreúva                         | 


      |2372401	|'13600040' |Casas Bahia - Araras|
      |4290313	|'24710480' |Casas Bahia - Alcântara 2|
      |1776000	|'28970000' |Casas Bahia - Araruama|
      |1693919	|'06401050' |Casas Bahia - Barueri 1|
      |5236644	|'07400490' |Casas Bahia - Arujá 2|
      |3636872	|'11700005' |Casas Bahia - Boqueirão |
      |12657575 |'21041010' |Casas Bahia - Bonsucesso 1|
      |9110951	|'27330042' |Casas Bahia - Barra Mansa|