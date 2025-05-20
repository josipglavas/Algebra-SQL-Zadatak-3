USE AdventureWorksOBP;
GO

CREATE PROCEDURE DodajKreditnuKarticu
    @BrojKartice NVARCHAR(25),
    @IstekMjesec TINYINT,
    @IstekGodina SMALLINT,
    @Tip NVARCHAR(50)
AS
BEGIN
    DECLARE @BrojPrije INT, @BrojPoslije INT;

    SELECT @BrojPrije = COUNT(*) FROM KreditnaKartica;

    INSERT INTO KreditnaKartica (Broj, IstekMjesec, IstekGodina, Tip)
    VALUES (@BrojKartice, @IstekMjesec, @IstekGodina, @Tip);

    SELECT @BrojPoslije = COUNT(*) FROM KreditnaKartica;

    PRINT 'Broj zapisa prije umetanja: ' + CAST(@BrojPrije AS NVARCHAR(10));
    PRINT 'Broj zapisa nakon umetanja: ' + CAST(@BrojPoslije AS NVARCHAR(10));
END;
GO

--Prvi nacin
EXEC DodajKreditnuKarticu 
    @BrojKartice = '1234567890123456',
    @IstekMjesec = 1,
    @IstekGodina = 2026,
    @Tip = 'Visa';
GO

--Drugi nacin
EXEC DodajKreditnuKarticu 
    '1234567890123456', 11, 2028, 'MasterCard';
GO

DROP PROCEDURE DodajKreditnuKarticu;
GO

SELECT * FROM KreditnaKartica

GO

CREATE PROCEDURE PronadiProizvodePoBoji
    @Boja1 NVARCHAR(50),
    @Boja2 NVARCHAR(50),
    @Boja3 NVARCHAR(50)
AS
BEGIN
    SELECT * 
    FROM Proizvod
    WHERE Boja IN (@Boja1, @Boja2, @Boja3);
END;
GO

EXEC PronadiProizvodePoBoji 
    @Boja1 = 'Crvena', 
    @Boja2 = 'Plava', 
    @Boja3 = 'Crna';
GO

DROP PROCEDURE PronadiProizvodePoBoji;
