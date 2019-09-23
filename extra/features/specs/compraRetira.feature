#language: pt

@compra_com_retira
Funcionalidade: Compra pelo o Retira
  Eu como usuário desejo
  realizar compras no site através
  do modulo de entrega retira rápido.

  Contexto: que o usuário esteja logado
    Dado que o usuario esteja logado na home da bandeira

  @realizar_compra_retira @full_regression
  Esquema do Cenario: Realizar Compra Retira
    Quando busco pelo o "<produto>"
    E levo o sku retira com o "<cep>" até a página de pagamento
    E finalizo a compra
    Então confirmo que o número do pedido foi apresentado 

    Exemplos:
      | produto  | cep      | 
      | 14817282 | 08040000 |
    #  | 9863236  | 09181140 |
    #  | 12369338 | 9520900  |

  @realizar_compra_retira_com_seguro @full_regression
  Esquema do Cenário: Realizar Compra Retira com seguros
    Quando busco pelo o "<produto>"    
    E escolho o produto solicitando retirada no "<cep>"
    E adiciono garantia e seguro para o produto
    E levo o produto até a página de pagamento
    E finalizo a compra
    Então confirmo que o número do pedido foi apresentado

    Exemplos:
      | produto  | cep      | 
      | 12369338 | 09520900 |

  @realizar_compra_retira_com_loja_especifica @full_regression
  Esquema do Cenário: Realizar Compra Retira com loja especifica
    Quando busco pelo o "<produto>"
    E levo o sku retira com o "<cep>" e "<loja>" até a página de pagamento
    E finalizo a compra
    Então confirmo que o número do pedido foi apresentado 

    Exemplos:
      | produto | cep      | loja                       |      
      |4451578	|'15500004'|	Casas Bahia - Votuporanga               |
    # |15341370	|'03066030' |PontoFrio - Shopping Anália Franco|
 
  @alterar_compra_normal_para_retira
  Esquema do Cenario: Alterar comprar normal para retira
    Quando busco pelo o "<produto>"
    E levo o sku até a tela de Endereço através do fluxo de compra informando o "<cep>"
    E altero a forma de entrega para a opção Retira
    E finalizo a compra
    Então confirmo que o número do pedido foi apresentado

    Exemplos:
      | produto  | cep        | 
      | 15077085 | '09520125' |  