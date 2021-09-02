--------------------------------------------------- Analise Negativa n18 - Cassi ---------------------------------------------------


-- database da operadora dona da transação (DF07)
database cassi


--primeira veirificação: checa na tbcontrato, atraves do car_numero se o prestador esta autorizado a transacionar o procedimento (prc_numero)
--ps: as informações necessárias para esta analise podem ser obtidas ao executar a query 'Principais informações sobre a transação' no script Analise_transação_Autorize.sql

SELECT
	   ems_numero, 
	   car_numero, 
	   prc_numero, 
	   con_tipo, 
	   con_restricao, 
	   con_motivo, 
	   con_dtiniciovalida, 
	   est_numero, 
	   con_dtfimvalidade 
	 FROM  tbcontrato
     WHERE 
       ems_numero =   346  AND 
       car_numero =  ? AND 
       prc_numero =   ?