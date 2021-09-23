--CREATE TABLE Municipio(
--	MunicipioID INT NOT NULL IDENTITY(1,1),
--	Descricao varchar(255) NOT NULL,
--	IBGE INT NOT NULL,
--	IBGE7 INT NOT NULL,
--	UFID INT NOT NULL,
--	SiglaUF CHAR(2) NOT NULL,
--	Regiao varchar(50) NOT NULL,
--    MesoregiaoID INT NOT NULL,
--    MicroregiaoID INT NOT NULL,
--	Populacao INT NOT NULL,
--	Porte VARCHAR(50) NOT NULL,
--	Capital BIT NOT NULL,
--	DataInsert DATETIME NOT NULL DEFAULT GETDATE(),
--	CONSTRAINT PK_Municipio PRIMARY KEY (MunicipioID)
--)


SET IDENTITY_INSERT Municipio ON
INSERT INTO Municipio(
MunicipioID,
Descricao,
IBGE,
IBGE7,
UFID,
SiglaUF,
Regiao,
MesoregiaoID,
MicroregiaoID,
Populacao, 
Porte,
Capital
)
SELECT 
NOVOC.MunicipioID,
NOVOC.Descricao,
NOVOC.IBGE,
NOVOC.IBGE7,
NOVOC.UFID,
NOVOC.SiglaUF,
NOVOC.Regiao,
COMP.MesoregiaoID,
COMP.MicroregiaoID,
NOVOC.Populacao, 
NOVOC.Porte,
NOVOC.Capital
FROM[dbo].[Novo_conjunto_Municipio_IBGE] as NOVOC
INNER JOIN [dbo].[Lista_Municipios_Complementar_IBGE] AS COMP ON NOVOC.MunicipioID = COMP.MunicipioID 
GO
SET IDENTITY_INSERT Municipio OFF
