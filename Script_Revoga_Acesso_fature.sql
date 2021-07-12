USE Dativa;

--CIRA��O DE UMA TABELA QUE ARMAZENAR� OS LOGINS � SEREM INATIVADOS E OS CAMPOS QUE SER�O ALTERADOS (a id�ia � utilizar essa tabela, tanto como parametro para altera��o quanto para backup)
CREATE TABLE inativa_logins
			(id_login int,
			 fl_LoginAtivo int, 
			 fl_EmailValido int, 
			 fl_ReCad int, 
			 fl_travado int,
			 fl_status int,
			 fl_troca_senha int
			 );	

--INSER��O DOS LOGINS � SEREM INATIVADOS NA TABELA CRIADA ACIMA
INSERT INTO inativa_logins (id_login, fl_LoginAtivo, fl_EmailValido, fl_ReCad, fl_travado, fl_status, fl_troca_senha)
			(SELECT id_login,fl_LoginAtivo, fl_EmailValido, fl_ReCad, fl_travado, fl_status, fl_troca_senha
			 FROM TB_FRA_LOGIN
			 WHERE id_login in (ids_login aqui)
			 );

--ALTERA��O NA TABELA EM PRODU��O (Visando melhora no desempenho, utilizo os logins inseridos na tabela 'inatica_logins' como par�metro de busca para as inativa��es na tabela em produ��o)
UPDATE TB_FRA_LOGIN 
SET fl_LoginAtivo = 0, fl_EmailValido = 0, fl_ReCad = 0, fl_travado = 1, fl_status = 0, fl_troca_senha = 0
--SELECT * FROM TB_FRA_LOGIN
WHERE id_login in (select id_login from inativa_logins);










			











