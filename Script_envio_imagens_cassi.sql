------------------------------Analise envio de imagens CASSI -----------------------------------

--DB utilizada na analise
database auditoria

-- Tabela de dominio do  envio de imagens
select * from informix.tbdom_status_envio_imagem



------------------ Query que retorna todas as imagens pendentes de envio à operadora-----------
SELECT
	* 
    count(*)
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
			t.trn_data = mdy(07,07,2021) 
	)
------------------------------Update de preparação das imagens para reenvio -------------------
UPDATE auditoria:tbtransacao_troca_informacao 
SET status = 2  
WHERE ems_numero = 346 
AND id_troca_informacao IN(--IDS_TROCA_INFORMACAO AQUI);