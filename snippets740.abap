"Comandos ABAP
"--------------------------------------------------------------------------------------
"Quando lt_routes for standard table de um campo. tomar somente entradas unicas da tabela. 
data lt_routes type standard table of vbak-vbeln. 
lt_routes = VALUE #( FOR GROUPS value OF <line> IN lt_komk 
                             GROUP BY <line>-route WITHOUT MEMBERS  ( value ) ). 
"--------------------------------------------------------------------------------------
"Criar range mais facilmente
 data : lr_bukrs type range of mseg-bukrs.

 APPEND  VALUE #(  sign = 'I' option = 'EQ' low = 'F660' ) TO lr_bukrs. 

"--------------------------------------------------------------------------------------
"preencher variavel de acordo com condição
mr_subrc = COND #( WHEN lines( t_alv ) > 0
                       THEN 0
                       ELSE 1 ).
"--------------------------------------------------------------------------------------                       
                       
"Somar os valores dos itens de uma ordem de vendas em uma tabela com várias
DATA: lt_active_items TYPE SORTED TABLE OF bapisdit WITH NON-UNIQUE KEY primary_key COMPONENTS doc_number.    

 

DATA(lv_total_value) = REDUCE bapicurext( INIT x = 0 FOR lwa_item
                                          IN FILTER #( lt_active_items USING KEY primary_key WHERE doc_number = lv_vbeln )
                                          NEXT x = x + lwa_item-subtot_pp5 ).
"--------------------------------------------------------------------------------------
