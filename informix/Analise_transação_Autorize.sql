----------------------------Analise de transação - Autorize ------------------

--Retorna o nome das tabelas para a operadora(db_name, no caso) de acordo com seu alias ()
select * from carga:alias_table where alias= '?' and db_name = '?'

-- database da operadora dona da transação (DF07)
database ?


--Principais informações sobre a transação (informações custumeiramente usadas em qualquer análise transacional )
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

-- caso seja necessário recuperar o codigo na operadora (normamente, é necessário para realizar consultas no portal Orizon Autorize - OOL)
select  pra_matricula from tbtransacao_complemento where trn_numero in (?)  




