#language: pt

@compra_com_retira
Funcionalidade: Buscar loja Retira
  Eu como usuário desejo
  realizar buscas de lojas no site através
  do modulo de entrega retira rápido.
  
  Contexto: que o usuário esteja logado
    Dado que o usuario esteja na página home da bandeira

    @teste
    Esquema do Cenario: Validar se a loja está sendo apresentada para o sku consultado
    Quando busco pelo o "<produto>"
    Então levo o sku retira com o "<cep>" até o modal que confirma a retirada no local   

    Exemplos:
        |produto    |cep        |                
        |14971368   |'04801000' |
        