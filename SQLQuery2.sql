USE AdventureWorksOBP;
GO

CREATE PROCEDURE FiltrirajKupcePoPrezimenu
    @Kriterij NVARCHAR(50),
    @BrojZadovoljenih INT OUTPUT
AS
BEGIN
    SELECT @BrojZadovoljenih = COUNT(*)
    FROM Kupac
    WHERE Prezime LIKE @Kriterij + '%';

    SELECT *
    FROM Kupac
    WHERE Prezime LIKE @Kriterij + '%';
END;
GO

DECLARE @Ukupno INT;

EXEC FiltrirajKupcePoPrezimenu 
    @Kriterij = 'Ma%',
    @BrojZadovoljenih = @Ukupno OUTPUT;


SELECT @Ukupno AS BrojKupaca;


DROP PROCEDURE FiltrirajKupcePoPrezimenu;
GO

CREATE PROCEDURE InfoOKomercijalistu
    @ID INT,
    @Ime NVARCHAR(50) OUTPUT,
    @Prezime NVARCHAR(50) OUTPUT,
    @UkupnoRacuna INT OUTPUT
AS
BEGIN
    SELECT @Ime = Ime, @Prezime = Prezime
    FROM Komercijalist
    WHERE IDKomercijalist = @ID;

    SELECT @UkupnoRacuna = COUNT(*)
    FROM Racun
    WHERE KomercijalistID = @ID;
END;
GO

DECLARE @Ime NVARCHAR(50), 
        @Prezime NVARCHAR(50), 
        @BrojRacuna INT;

EXEC InfoOKomercijalistu 
    @ID = 1, 
    @Ime = @Ime OUTPUT, 
    @Prezime = @Prezime OUTPUT, 
    @UkupnoRacuna = @BrojRacuna OUTPUT;

SELECT 
    @Ime AS Ime, 
    @Prezime AS Prezime, 
    @BrojRacuna AS UkupnoRacuna;

DROP PROCEDURE InfoOKomercijalistu;
