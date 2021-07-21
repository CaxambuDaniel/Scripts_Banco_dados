/*
Regra_847
Scripts para auxiliar na análise da Regra 847
Captação dos dados no SQL
Primeiro passo, coletar as informações relacioandas a aplicação da Regra no Fature.

Após isso executar as tarefas relacionadas ao DF15

Select * from CRITICASDOLOTEDINAMICA with(nolock) where id_lote=77363161  and  Total=1 and codigo=847
Select * from lote with(nolock) where id_lote=76884738 
select * from conta with(nolock) where id_conta=1863281263
select * from item with(nolock) where id_item  in (1276734246)
*/
Lote........: 77363161      
Matricula...: 0000628140

Carteirinha					Procedimento
------------------------- --------------------
960830011207009 (21,05) 	20103506


-- 1 e 2 - Executar o select abaixo para pegar exibir as informações relacionadas a aplicação da Regra (Preencher dados do item 4). [,cld.mensagem]
Declare @lote int; set @lote=77363161
Select distinct l.ID_PRESTADOR, l.id_lote as 'Lote',c.cnpj_cpf_codnaoperadora_executante as 'Matricula',c.COD_paciente as 'Carteirinha',i.servico as 'Procedimento'--,i.DATA 
from Lote l with(nolock)
	inner join CRITICASDOLOTEDINAMICA cld with(nolock) on l.id_lote=cld.id_lote
	inner join CONTA c with(nolock) on cld.id_conta=c.id_conta
	inner join ITEM i with(nolock) on cld.id_item=i.id_item
Where l.id_lote=@lote and
cld.mensagem like 'Faturamento de fisioterapia não autorizado.: Qtd de procedimentos de Fisio ultrapassa o autorizado.%' and
cld.Total=1 and cld.codigo=847

--3 - Com todas as informações recolhidas, vai gerar aqui um histórico dessa cobrança com os dados abaixo. 
Declare @id_lote int =77363161; Declare @Carteirinha varchar(20) ='960830011207009' ; Declare @Procedimento int = 20103506
select l.id_lote,l.documento,c.NRO_CONTA,c.COD_paciente,i.servico,i.QTD,i.DATA from lote l with(nolock)
       inner join conta c with(nolock) on c.id_lote=l.id_lote
       inner join item i with(nolock) on c.id_conta=i.ID_CONTA
where i.SERVICO=@Procedimento and c.COD_paciente=@Carteirinha and l.id_lote=@id_lote

Select l.id_lote,s.ds_status,l.documento,c.COD_paciente,i.servico, sum(i.QTD) as 'Total já Cobrado'
--l.id_lote,l.status,l.documento,c.NRO_CONTA,c.COD_paciente,i.servico,i.QTD 
from lote l with(nolock)
 	   inner join status s with(nolock) on l.status=s.status
       inner join conta c with(nolock) on c.id_lote=l.id_lote
       inner join item i with(nolock) on c.id_conta=i.ID_CONTA
where i.SERVICO=@Procedimento and c.COD_paciente=@Carteirinha and l.status>=3
Group by l.id_lote,s.ds_status,l.documento,c.COD_paciente,i.servico 


--4 - Ir para o Informix e checar os dados lá os dados recolhidos nos selects acima.
select first 10 * from fature:tb571autorizacao_faturamento_historico_autorize  
where pra_matricula=0000629847 and prc_numero=50000446 and usu_numero=774135046930002;

select first 10 * from fature:tb571autorizacao_faturamento_historico_fature 
where pra_matricula=0000629847 and prc_numero=50000446 and usu_numero=774135046930002;
-- O resultado do Select acima irá informar os lotes ativos no Fature (não cancelados), pegue os Id destes lotes e confirme se estão realmente ativos no Fature através do item 5

select first 10 * from fature:tb571autorizacao_faturamento 
where pra_matricula=0000629847 and prc_numero=50000446 and usu_numero=774135046930002;


--5 - Caso necessário checar qual o status dos lotes ativos no Informix estão no Fature.
-- Caso encontre algum dos lotes cancelado, deverá encaminhar para Middleware pois houve erro na execução do JoB
Select l.id_lote,s.ds_status,dataenvio from lote l with(nolock)
	inner join status s with(nolock) on l.status=s.status
where l.id_lote in (74910311,75162093,76309449,77171674)
union
Select l.id_lote,s.ds_status,dataenvio from LOTE_Historico l with(nolock)
	inner join status s with(nolock) on l.status=s.status
where l.id_lote in (74910311,75162093,76309449,77171674)

--6 - Caso exista algum lote cancelado acima, será necessário solicitar que o DBA faça o update abaixo
--Na DF15
Select * from fature:tblote_fature where id_lote = 71888924 ;
update fature:tblote_fature set status = null where id_lote = 71888924 ;

-- 7 - Caso o lote já tenha sido expurgado, temos que ajustar na mão o saldo, substituindo os valores e cancelando o lote manualmente.
-- Cancela o lote, não esqueça de colocar a data correta de cancelamento.
-- pegar data de Cancelamento Select * from LOTE_Historico l with(nolock) where id_lote=71888924
update fature:tb571autorizacao_faturamento_historico_fature
Set data_cancelamento='27/03/2020 15:49'
where pra_matricula=0000747947 and prc_numero=50000446 and usu_numero=770339024651002 and data_cancelamento is null and id_lote=71888924;
-- Atualiza o saldo, necessário fazer a conta de abatimento da quantidade do lote cancelado acima
Update  fature:tb571autorizacao_faturamento 
set qtd_faturada=0
where pra_matricula=0000381047 and prc_numero=20103506 and usu_numero=544544186715009;
