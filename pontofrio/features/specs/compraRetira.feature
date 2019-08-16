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
      | produto   | cep      | loja                       |
     # | 12369338  | 09520900 | Casas Bahia - Shopping ABC |
     # | 2294	    | 05073000 | Casas Bahia - Lapa 2 |
      | 2566		  | 05073000 | Casas Bahia - Lapa 2 |
      | 4133	    | 05073000 | Casas Bahia - Lapa 2 |
      | 298901		| 05073000 | Casas Bahia - Lapa 2 |
      | 410915		| 05073000 | Casas Bahia - Lapa 2 |
      | 1591124	  | 05073000 | Casas Bahia - Lapa 2 |
      | 2181324	  | 05073000 | Casas Bahia - Lapa 2 |
      | 2266346	  | 05073000 | Casas Bahia - Lapa 2 |
      | 2372401	  | 05073000 | Casas Bahia - Lapa 2 |
      | 2938841	  | 05073000 | Casas Bahia - Lapa 2 |
      | 3636872	  | 05073000 | Casas Bahia - Lapa 2 |
      | 3856587	  | 05073000 | Casas Bahia - Lapa 2 |
      | 5082526	  | 05073000 | Casas Bahia - Lapa 2 |
      | 5082530	  | 05073000 | Casas Bahia - Lapa 2 |
      | 8618946	  | 05073000 | Casas Bahia - Lapa 2 |
      | 9110951	  | 05073000 | Casas Bahia - Lapa 2 |
      | 9663564	  | 05073000 | Casas Bahia - Lapa 2 |
      | 10442841  | 05073000 | Casas Bahia - Lapa 2 |
      | 11672606	| 05073000 | Casas Bahia - Lapa 2 |
      | 11742745	| 05073000 | Casas Bahia - Lapa 2 |
      | 11782659	| 36010002 | Casas Bahia - Juiz de Fora Halfeld |
	    | 11782659	| 79002331 | Casas Bahia - Campo Grande 1 MS |
	    | 11782659	| 64000060 | Casas Bahia - Galeria Jet |
	    | 11782659	| 29165130 | Casas Bahia - Serra |
	    | 11782659	| 74505016 | Casas Bahia - Setor Campinas |
	    | 11782659	| 65010230 | Casas Bahia - Grande Center |
	    | 11782659	| 88101000 | Casas Bahia - São José 2 |
	    | 11782659	| 57020000 | Casas Bahia - Maceió |
	    | 9073054	  | 64000060 | Casas Bahia - Galeria Jet |
	    | 1767845	  | 74505016 | Casas Bahia - Setor Campinas |
	    | 5236644	  | 79002331 | Casas Bahia - Campo Grande 1 MS |
	    | 5236644	  | 29010002 | Casas Bahia - Vitória |
	    | 11700686	| 74505016 | Casas Bahia - Setor Campinas |
	    | 4451527	  | 49010380 | Casas Bahia - Aracajú |
	    | 11439319	| 49010380 | Casas Bahia - Aracajú |
	    | 13395307	| 49010380 | Casas Bahia - Aracajú |
	    | 2293574	  | 49010380 | Casas Bahia - Aracajú |
	    | 2293577	  | 49010380 | Casas Bahia - Aracajú |
	    | 4451561	  | 80020320 | Casas Bahia - Curitiba |
	    | 11439320	| 74505016 | Casas Bahia - Setor Campinas |