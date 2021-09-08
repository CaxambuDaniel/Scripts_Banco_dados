--------------------------------------------------- Analise Negativa N18 - Cassi ---------------------------------------------------
--OBS: Caso o procedimento seja auditavel, há um bypass relizado pelo autorizador no momento da verificação desta negativa

-- database da operadora dona da transação (DF07)
database cassi


--primeira veirificação: checa na tbcontrato, atraves do car_numero se o prestador esta autorizado a transacionar o procedimento (prc_numero)
--obs: as informações necessárias para esta analise podem ser obtidas ao executar a query 'Principais informações sobre a transação' no script Analise_transação_Autorize.sql 
--ACESSE NO LINK: https://github.com/CaxambuDaniel/Scripts_Banco_dados/blob/main/informix/Analise_transa%C3%A7%C3%A3o_Autorize.sql

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
       
       
-- Caso o contrato seja retornado na query acima, o prestador esta autorizado a transacionar.
-- Caso não ache, há outra validação,por especialidade (query abaixo)


	 SELECT FIRST 1 
	    pds.ems_numero ems_numero, 
	    pds.ssp_numero ssp_numero, 
	    pds.prc_numero prc_numero, 
	    pds.pds_tipo pds_tipo, 
	    pds.pds_restricao pds_restricao, 
	    pds.pds_motivo pds_motivo, 
	    pse.pse_nivelespec pse_nivelespec 
	  FROM 
	    tbautogeradosub  pds 
	       INNER JOIN 
	    tbespec_sub   pss 
	       ON (pss.ems_numero = pds.ems_numero 
	       AND pss.ssp_numero = pds.ssp_numero) 
	       INNER JOIN 
	    tbcartao_subesp pse 
	       ON (pse.ems_numero = pds.ems_numero 
	       AND pse.ssp_numero = pds.ssp_numero) 

	 WHERE 
	    pds.ems_numero = 346 AND
	    pds.prc_numero = ? AND
	    pds.pds_tipo = ? AND
	    pse.car_numero = ?

      ORDER BY pse.pse_nivelespec, pds.ssp_numero

--o campo pds_tipo é a natureza do procedimento que está no log, mais especificamente no registro da aplicação da regra. ele olha pros campos Motivo e Restrição dessas queries. 
--Se por um acaso ele achar a linha na query, mas tiver com restrição N, ele nega.
--Se nenhuma dessas queries retornar algo ele nega   