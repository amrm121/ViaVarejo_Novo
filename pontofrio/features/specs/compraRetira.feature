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
      
       |4451578	|'15500004'|	Casas Bahia - Votuporanga               |
       |4451578	|'35680062'|	Casas Bahia - Itauna                    |
       |4451578	|'35680062'|	Casas Bahia - Itauna                    |
       |4451578	|'37002080'|	PontoFrio - Varginha 2                  |
       |4451578	|'44571355'|	Casas Bahia - Santo Antonio de Jesus    |
       |4451578	|'15400000'|	Casas Bahia - Olímpia                   |
       |4451578	|'7252000'	|Casas Bahia - Shopping Bonsucesso          |
       |4451578	|'9972260'	|Casas Bahia - Eldorado                     |
       |4451578	|'87200268'|	Casas Bahia - Cianorte                  |
       |4451578	|'79300040'|	Casas Bahia - Corumbá                   |
       |4451578	|'16901010'|	Casas Bahia - Andradina                 |
       |4451578	|'16901010'|	Casas Bahia - Andradina                 |
       |4451578	|'79500000'|	Casas Bahia - Paranaíba                 |
       |4451578	|'32400221'|	Casas Bahia - Ibirité                   |
       |4451578	|'21351050'|	PontoFrio - Madureira shopping 2        |
 

     