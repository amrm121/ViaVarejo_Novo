#language: pt

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
      | 14817282 | 08040000 |
      | 9863236  | 09520900 |
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
      | produto  | cep      | 
      | 12369338 | 09520900 |
    
  @realizar_compra_retira_com_loja_especifica 
  Esquema do Cenario: Realizar Compra Retira com loja especifica
      Quando busco pelo o "<produto>"
      E levo o sku retira com o "<cep>" e "<loja>" até a página de pagamento
      E finalizo a compra
      Então confirmo que o número do pedido foi apresentado 

      Exemplos:
        |produto    |cep        |loja                                |                      
        #|11235957	|'13318000' |Casas Bahia - Cabreúva|
        #|15341370	|'03066030' |Casas Bahia - Shopping Metrô Boulevard Tatuapé|
        #|344689	  |'12940660' |Casas Bahia - Atibaia|
        #|15341354	|'11250000' |Casas Bahia - Bertioga|
        #|1765784	|'18400510' |Casas Bahia - Itapeva|
        |3614064	|'13900005' |Casas Bahia - Amparo|
        #|3623385	|'13900005' |PontoFrio - Amparo 2|





        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        