

CREATE TABLE zaposlenici (
    id_zaposlenik     INT PRIMARY KEY,
    id_voditelj       INT,
    ime               VARCHAR2(50) NOT NULL,
    prezime           VARCHAR2(50) NOT NULL,
    email             VARCHAR2(100) NOT NULL,
    specijalizacija   VARCHAR2(100),
    CONSTRAINT fk_voditelj FOREIGN KEY (id_voditelj) REFERENCES zaposlenici(id_zaposlenik)
);

CREATE TABLE statusi (
    id_status   INT PRIMARY KEY,
    radnja      VARCHAR2(50) NOT NULL
);

CREATE TABLE statusi_po_ulozi (
    id_status   INT NOT NULL,
    uloga       VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_statusi_po_ulozi PRIMARY KEY (id_status, uloga),
    CONSTRAINT fk_statusi_uloga FOREIGN KEY (id_status) REFERENCES statusi(id_status)
);

CREATE TABLE zadaci (
    id_zadatak         INT PRIMARY KEY,
    naziv              VARCHAR2(100) NOT NULL,
    programski_jezik   VARCHAR2(50),
    id_status          INT NOT NULL,
    id_zaposlenik      INT NOT NULL,
    CONSTRAINT fk_zadaci_status FOREIGN KEY (id_status) REFERENCES statusi(id_status),
    CONSTRAINT fk_zadaci_zaposlenik FOREIGN KEY (id_zaposlenik) REFERENCES zaposlenici(id_zaposlenik)
);

CREATE TABLE aktivnosti_po_zadatku (
    id_apz       INT PRIMARY KEY,
    id_zadatak   INT NOT NULL,
    komentar     CLOB,
    CONSTRAINT fk_aktivnosti_zadatak FOREIGN KEY (id_zadatak) REFERENCES zadaci(id_zadatak)
);


INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (1, NULL, 'Ivan', 'Horvat', 'ivan.horvat@firma.com', 'Direktor');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (2, 1, 'Ana', 'Kovaè', 'ana.kovac@firma.com', 'Razvoj softvera');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (3, 1, 'Marko', 'Novak', 'marko.novak@firma.com', 'Testiranje');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (4, 2, 'Luka', 'Periæ', 'luka.peric@firma.com', 'Frontend razvoj');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (5, 2, 'Maja', 'Šariæ', 'maja.saric@firma.com', 'Backend razvoj');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (6, 2, 'Patrik', 'Fabijaniæ', 'p.fabijanic@firma.com', 'SQL Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (7, 2, 'David','Tarèuki', 'dtarèuki@firma.com', 'SQL Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (8, 2, 'Goran','Oreški', 'goran.oreški@firma.com', 'SQL Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (9, 2, 'Ivan','Iviæ', 'ivo.ivic@firma.com', 'SQL Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (10, 2, 'Gregor','Mešiæ', 'mesic.g@firma.com', 'Apex Oracle Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (11, 2, 'Slaven','Biliæ', 'slaven.bilic3@firma.com', 'Apex Oracle Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (12, 3, 'Jakov','Železen', 'jakovzelezen@firma.com', 'QA inženjer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (13, 3, 'Marina','Mrkiæ', 'marina.mrkic12@firma.com', 'Manual tester');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (14, 3, 'Igor','Sakiæ', 'igor.s@firma.com', 'Automatizirani tester');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (15, 3, 'Tomislav','Atiæ', 'tomaati@firma.com', 'Test analitièar');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (16, 3, 'Tamara','Tomiæ', 'ttomich@firma.com', 'UI/UX dizajner');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (17, 1, 'Max','Šariæ', 'max.sar@firma.com', 'DevOps inženjer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (18, 1, 'Alen','Asenoviæ', 'asen.alen@firma.com', 'DevOps inženjer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (19, 17, 'Sandra','Jelenoviæ', 'jelensandra@firma.com', 'Cloud inženjer');



INSERT INTO statusi (id_status, radnja) VALUES (1, 'Upisano');
INSERT INTO statusi (id_status, radnja) VALUES (2, 'U tijeku');
INSERT INTO statusi (id_status, radnja) VALUES (3, 'Završeno');
INSERT INTO statusi (id_status, radnja) VALUES (4, 'Prihvaæeno');
INSERT INTO statusi (id_status, radnja) VALUES (5, 'Otkazano');


INSERT INTO statusi_po_ulozi (id_status, uloga) VALUES (1, 'OSOBA');
INSERT INTO statusi_po_ulozi (id_status, uloga) VALUES (2, 'OSOBA');
INSERT INTO statusi_po_ulozi (id_status, uloga) VALUES (3, 'OSOBA');
INSERT INTO statusi_po_ulozi (id_status, uloga) VALUES (4, 'OSOBA');
INSERT INTO statusi_po_ulozi (id_status, uloga) VALUES (4, 'VODITELJ');
INSERT INTO statusi_po_ulozi (id_status, uloga) VALUES (5, 'VODITELJ');


INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (101, 'Izrada login forme', 'PL/SQL', 2, 4);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (102, 'Testiranje baze podataka', 'SQL', 1, 3);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (103, 'API za upravljanje korisnicima', 'Java', 2, 5);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (104, 'Dizajn korisnièkog suèelja', 'HTML/CSS', 3, 4);


INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1001, 101, 'Zapoèeo rad na formi, radi se na validaciji unosa.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1002, 102, 'Priprema testnih podataka.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1003, 103, 'Implementacija CRUD funkcionalnosti.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1004, 104, 'Dizajn završen, èeka se odobrenje.');


SELECT * FROM aktivnosti_po_zadatku;

SELECT * FROM zaposlenici;