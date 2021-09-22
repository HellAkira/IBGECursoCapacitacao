--CREATE TABLE Novo_conjunto_Municipio_IBGE(
--	MunicipioID INT NOT NULL,
--	Descricao varchar(255) NOT NULL,
--	IBGE INT NOT NULL,
--	IBGE7 INT NOT NULL,
--	UFID INT NOT NULL,
--	SiglaUF CHAR(2) NOT NULL,
--	Regiao varchar(50) NOT NULL,
--	Populacao INT NOT NULL,
--	Porte VARCHAR(50) NOT NULL,
--	Capital BIT NOT NULL,
--)

INSERT INTO Novo_conjunto_Municipio_IBGE(
MunicipioID,
Descricao,
IBGE,
IBGE7,
UFID,
SiglaUF,
Regiao,
Populacao, 
Porte,
Capital
)
SELECT
Dados.MunicipioID,
Dados.Nome,
List.IBGE,
Dados.IBGE7,
Dados.UFID,
List.UF,
List.[Região],
CAST (List.Populacao AS INT) AS Populacao2010,
List.Porte,
case List.Capital
	when 'NULL' THEN 0
	ELSE 1
	END AS CapitalBit
FROM ListaMunicipios AS List
INNER JOIN[dbo].[Dados - Municipios - IBGE7] as Dados ON List.IBGE7 = Dados.IBGE7
GO




