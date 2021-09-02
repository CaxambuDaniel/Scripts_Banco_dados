------------------------------Analise envio de imagens CASSI -----------------------------------

--DB utilizada na analise
database auditoria

------------------------------------------------------------------------------

-- Tabela de dominio do status de envio de imagens
select * from tbdom_status_envio_imagem
-- Tabela de dominio do status de envio de guias
select * from tbstatus_transacao_troca_informacao

------------------------------------------------------------------------------


--busca id_troca_informação para pesquisar imagens
select * from  tbtransacao_troca_informacao where  trn_numero in (210268586,210320292) and  id_troca_informacao in (12900803,12917291) 

--pesquisa imagens pelo id_troca_informação
select * from tbimagem where id_troca_informacao in (13245529,13245530,13245531,13245533,13245534,13245536) 


--Query para checar o a obrigatoriedade do envio de imagens pelo prestador via OOL 
select first 10 * from cassi:tbprocedimento_auditoria where prc_numero in (4712300)

------------------ Query que retorna todas as imagens pendentes de envio à operadora-----------
SELECT
	* 
    --count(*)
FROM
	(	SELECT
			--DISTINCT id_imagem 
            DISTINCT ti.id_troca_informacao
		FROM
			cassi:tbtransacao_roteador rot,
			cassi:tbtransacao t,
			auditoria:tbimagem i,
			auditoria:tbtransacao_troca_informacao ti 
		WHERE
			t.trn_numero=rot.trn_numero AND
			t.trn_sequencial=1 AND
			ti.trn_numero=t.trn_numero AND
			t.ems_numero=ti.ems_numero AND
			i.id_troca_informacao = ti.id_troca_informacao AND
			i.status_envio_imagem IN (0,2,3) AND
			t.trn_data >= mdy(08,31,2021)  
	)
	
	
	
------------------------------Update de preparação das imagens para reenvio -------------------
UPDATE auditoria:tbtransacao_troca_informacao 
SET status = 2  
--select * from tbtransacao_troca_informacao
WHERE ems_numero = 346 
AND id_troca_informacao IN(13230354,13238343,13245129,13245172,13245307,13245326);
