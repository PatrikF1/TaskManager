
CREATE TABLE zaposlenici (
    id_zaposlenik     INT PRIMARY KEY,
    id_voditelj       INT,
    ime               VARCHAR(50) NOT NULL,
    prezime           VARCHAR(50) NOT NULL,
    email             VARCHAR(100) NOT NULL,
    specijalizacija   VARCHAR(100),
    FOREIGN KEY (id_voditelj) REFERENCES zaposlenici(id_zaposlenik)
);


CREATE TABLE statusi (
    id_status   INT PRIMARY KEY,
    radnja      VARCHAR(50) NOT NULL
);


CREATE TABLE zadaci (
    id_zadatak         INT PRIMARY KEY,
    naziv              VARCHAR(100) NOT NULL,
    programski_jezik   VARCHAR(50),
    id_status          INT NOT NULL,
    id_zaposlenik      INT NOT NULL,
    FOREIGN KEY (id_status) REFERENCES statusi(id_status),
    FOREIGN KEY (id_zaposlenik) REFERENCES zaposlenici(id_zaposlenik)
);


CREATE TABLE aktivnosti_po_zadatku (
    id_apz       INT PRIMARY KEY,
    id_zadatak   INT NOT NULL,
    komentar     CLOB,
    FOREIGN KEY (id_zadatak) REFERENCES zadaci(id_zadatak)
);
