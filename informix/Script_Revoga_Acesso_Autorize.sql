--conecta a base de dados onde a tabela dos logins � serem inativados se encontra 
database autenticador

--Seleciona os logins � serem inativados e os armazena em uma tabela tempor�ria chamada 'inativa_logins'(o intuito � melhorar o desempenho do script) 							 
select usu_login 
from tbusuario 
where usu_login in ('Inserir Logins aqui')
into temp inativa_logins							);							 

--utiliza as informa��es armazenadas na tabela temporaria como par�metro para inativa��o dos logins.
update autenticador:TBUSUARIO
set usu_situacao = '5'
--select * from autenticador:tbusuario 
where usu_login in (select * from inativa_logins)