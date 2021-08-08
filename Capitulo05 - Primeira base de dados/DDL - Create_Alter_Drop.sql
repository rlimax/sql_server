--CAPITULO 5
/*
1 - CREATE DATABASE					- Cria banco de dados
2 - ALTER DATABASE					- Altera banco de dados
3 - CREATE TABLE					- Cria tabela
4 - DROP TABLE/DATABASE IF EXISTS	- Exclus�o condicional de tabela/banco de dados

*/
---------------------------Criar banco de dados simples
CREATE DATABASE dataone;
GO

---------------------------Renomear banco de dados
ALTER DATABASE dataone MODIFY NAME = data_one
--EXEC sp_rename 'dataone', 'data_one';
GO

---------------------------Seta banco de dados
USE data_one;
GO

---------------------------Criar tabela
CREATE TABLE dados_one(
id_dado int NOT NULL IDENTITY PRIMARY KEY,
nome_dado VARCHAR(30) NOT NULL,
tipo_dado CHAR(2) NOT NULL
)
GO

---------------------------Renomear tabela
EXEC sp_rename 'dados_one', 'dados';
GO

---------------------------Adiciona coluna
ALTER TABLE dados ADD situacao CHAR(1);
GO

---------------------------Altera coluna (tipo)
ALTER TABLE dados ALTER COLUMN situacao CHAR(2);
GO

---------------------------Renomeia coluna
EXEC sp_rename 'dados.situacao', 'situacao_bancaria', 'COLUMN';
GO

---------------------------Remove coluna
ALTER TABLE dados DROP COLUMN situacao_bancaria;
GO

---------------------------Exclus�o condicional de tabela
DROP TABLE IF EXISTS dados;
GO

---------------------------Seta banco de dados
USE master;
GO

---------------------------Desconex�o de todos os usu�rios com rollback e setagem como �nico usu�rio.
ALTER DATABASE [data_one] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

---------------------------Exclus�o condicional de banco de dados
DROP DATABASE IF EXISTS data_one;
GO
