----------------------------Analise de transa��o - Autorize ------------------

--Retorna o nome das tabelas para a operadora(db_name, no caso) de acordo com seu alias ()
select * from carga:alias_table where alias= '?' and db_name = '?'

-- database da operadora dona da transa��o (DF07)
database ?


--Principais informa��es sobre a transa��o (informa��es custumeiramente usadas em qualquer an�lise transacional )
SELECT  
	trn_guiaprestador,
	trn_numero,
	trn_data,
	trn_hora,
	tht_codigo,
	car_numero,
	prc_numero,
	trn_situacao,
	msg_codigo,
	usu_cartao,
	ems_numero 	 
FROM 
	tbtransacao 
WHERE 	trn_numero in  (? )
ORDER BY trn_data,trn_hora

-- caso seja necess�rio recuperar o codigo na operadora (normamente, � necess�rio para realizar consultas no portal Orizon Autorize - OOL)
select  pra_matricula from tbtransacao_complemento where trn_numero in (?)  




