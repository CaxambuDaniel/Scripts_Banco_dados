DECLARE @protocolo varchar(30),@idConta varchar (30);  
  
SET @protocolo  = '79518501'; 
SET @idConta = (Select top 1 id_conta from CRITICASDOLOTEDINAMICA with(nolock) where Total=1 and codigo=847 and id_lote=@protocolo  );

Select id_lote as 'Lote',documento as 'Matricula' from Lote with(nolock) where id_lote= @protocolo                     
Select distinct id_lote,id_conta,codigo,mensagem,nro_conta,acao from CRITICASDOLOTEDINAMICA with(nolock) where Total=1 and codigo=847 and id_lote=@protocolo              
and mensagem like 'Faturamento de fisioterapia não autorizado.: Qtd de procedimentos de Fisio ultrapassa o autorizado.%' 
           
Select id_conta,COD_paciente as 'Carteirinha',cnpj_cpf_codnaoperadora_executante as 'Matricula' from CONTA with(nolock) where id_lote=@protocolo and ID_CONTA in (@idConta)


--verifica a quantidade de procedimentos o prestador esta tentando faturar
Declare @id_lote int =79518501; Declare @Carteirinha varchar(20) ='773012000280014' ; Declare @Procedimento int = 20103115
select l.id_lote,l.documento,c.NRO_CONTA,c.COD_paciente,i.servico,i.QTD,i.DATA from lote l with(nolock)
       inner join conta c with(nolock) on c.id_lote=l.id_lote
       inner join item i with(nolock) on c.id_conta=i.ID_CONTA
where i.SERVICO=@Procedimento and c.COD_paciente=@Carteirinha and l.id_lote=@id_lote

--verifica a quantidade de procedimetnos já faturados pelo prestador 
Select l.id_lote,s.ds_status,l.documento,c.COD_paciente,i.servico, sum(i.QTD) as 'Total já Cobrado'
--l.id_lote,l.status,l.documento,c.NRO_CONTA,c.COD_paciente,i.servico,i.QTD 
from lote l with(nolock)
 	   inner join status s with(nolock) on l.status=s.status
       inner join conta c with(nolock) on c.id_lote=l.id_lote
       inner join item i with(nolock) on c.id_conta=i.ID_CONTA
where i.SERVICO=@Procedimento and c.COD_paciente=@Carteirinha and l.status>=3
Group by l.id_lote,s.ds_status,l.documento,c.COD_paciente,i.servico 




-- Verificar se há lotes cancelados 
CREATE TABLE #id_lote(
						id_lote int
					 )

INSERT INTO #id_lote (id_lote) 
		(SELECT id_lote FROM LOTE where ID_LOTE in (78719094)) 					 


Select l.id_lote,s.ds_status,dataenvio from lote l with(nolock)
	inner join status s with(nolock) on l.status=s.status
where l.id_lote in (select * from #id_lote)
union
Select l.id_lote,s.ds_status,dataenvio from LOTE_Historico l with(nolock)
	inner join status s with(nolock) on l.status=s.status
where l.id_lote in (select * from #id_lote)

DROP TABLE #id_lote