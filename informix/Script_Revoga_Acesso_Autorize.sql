--conecta a base de dados onde a tabela dos logins à serem inativados se encontra 
database autenticador

--Seleciona os logins à serem inativados e os armazena em uma tabela temporária chamada 'inativa_logins'(o intuito é melhorar o desempenho do script) 							 
select usu_login 
from tbusuario 
where usu_login in ('Inserir Logins aqui')
into temp inativa_logins							);							 

--utiliza as informações armazenadas na tabela temporaria como parâmetro para inativação dos logins.
update autenticador:TBUSUARIO
set usu_situacao = '5'
--select * from autenticador:tbusuario 
where usu_login in (select * from inativa_logins)