USE Dativa;

--CIRAÇÃO DE UMA TABELA QUE ARMAZENARÁ OS LOGINS À SEREM INATIVADOS E OS CAMPOS QUE SERÃO ALTERADOS (a idéia é utilizar essa tabela, tanto como parametro para alteração quanto para backup)
CREATE TABLE inativa_logins
			(id_login int,
			 fl_LoginAtivo int, 
			 fl_EmailValido int, 
			 fl_ReCad int, 
			 fl_travado int,
			 fl_status int,
			 fl_troca_senha int
			 );	

--INSERÇÃO DOS LOGINS À SEREM INATIVADOS NA TABELA CRIADA ACIMA
INSERT INTO inativa_logins (id_login, fl_LoginAtivo, fl_EmailValido, fl_ReCad, fl_travado, fl_status, fl_troca_senha)
			(SELECT id_login,fl_LoginAtivo, fl_EmailValido, fl_ReCad, fl_travado, fl_status, fl_troca_senha
			 FROM TB_FRA_LOGIN
			 WHERE id_login in (--ids_login aqui)
			 );

--ALTERAÇÃO NA TABELA EM PRODUÇÃO (Visando melhora no desempenho, utilizo os logins inseridos na tabela 'inatica_logins' como parâmetro de busca para as inativações na tabela em produção)
UPDATE TB_FRA_LOGIN 
SET fl_LoginAtivo = 0, fl_EmailValido = 0, fl_ReCad = 0, fl_travado = 1, fl_status = 0, fl_troca_senha = 0
--SELECT * FROM TB_FRA_LOGIN
WHERE id_login in (select id_login from inativa_logins);










			











