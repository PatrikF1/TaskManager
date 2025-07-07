

DROP TABLE aktivnosti_po_zadatku CASCADE CONSTRAINTS;
DROP TABLE zadaci CASCADE CONSTRAINTS;
DROP TABLE statusi CASCADE CONSTRAINTS;
DROP TABLE zaposlenici CASCADE CONSTRAINTS;


CREATE TABLE zaposlenici (
    id_zaposlenik     INT PRIMARY KEY,
    id_voditelj       INT,
    ime               VARCHAR(50) NOT NULL,
    prezime           VARCHAR(50) NOT NULL,
    email             VARCHAR(100) NOT NULL,
    specijalizacija   VARCHAR(100),
    FOREIGN KEY (id_voditelj) REFERENCES zaposlenici(id_zaposlenik)ON DELETE CASCADE
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

INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (1, NULL, 'Ivan', 'Horvat', 'ivan.horvat@firma.com', 'Direktor');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (2, 1, 'Ana', 'Kova�', 'ana.kovac@firma.com', 'Razvoj softvera');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (3, 1, 'Marko', 'Novak', 'marko.novak@firma.com', 'Testiranje');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (4, 2, 'Luka', 'Peri�', 'luka.peric@firma.com', 'Frontend razvoj');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (5, 2, 'Maja', '�ari�', 'maja.saric@firma.com', 'Backend razvoj');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (6, 2, 'Patrik', 'Fabijani�', 'p.fabijanic@firma.com', 'SQL Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (7, 2, 'David','Tar�uki', 'dtar�uki@firma.com', 'SQL Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (8, 2, 'Goran','Ore�ki', 'goran.ore�ki@firma.com', 'SQL Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (9, 2, 'Ivan','Ivi�', 'ivo.ivic@firma.com', 'SQL Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (10, 2, 'Gregor','Me�i�', 'mesic.g@firma.com', 'Apex Oracle Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (11, 2, 'Slaven','Bili�', 'slaven.bilic3@firma.com', 'Apex Oracle Developer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (12, 3, 'Jakov','�elezen', 'jakovzelezen@firma.com', 'QA in�enjer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (13, 3, 'Marina','Mrki�', 'marina.mrkic12@firma.com', 'Manual tester');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (14, 3, 'Igor','Saki�', 'igor.s@firma.com', 'Automatizirani tester');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (15, 3, 'Tomislav','Ati�', 'tomaati@firma.com', 'Test analiti�ar');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (16, 3, 'Tamara','Tomi�', 'ttomich@firma.com', 'UI/UX dizajner');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (17, 1, 'Max','�ari�', 'max.sar@firma.com', 'DevOps in�enjer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (18, 1, 'Alen','Asenovi�', 'asen.alen@firma.com', 'DevOps in�enjer');
INSERT INTO zaposlenici (id_zaposlenik, id_voditelj, ime, prezime, email, specijalizacija) VALUES (19, 17, 'Sandra','Jelenovi�', 'jelensandra@firma.com', 'Cloud in�enjer');

INSERT INTO statusi (id_status, radnja) VALUES (1, 'Upisano');
INSERT INTO statusi (id_status, radnja) VALUES (2, 'U tijeku');
INSERT INTO statusi (id_status, radnja) VALUES (3, 'Zavr�eno');
INSERT INTO statusi (id_status, radnja) VALUES (4, 'Prihva�eno');
INSERT INTO statusi (id_status, radnja) VALUES (5, 'Otka�ano');



INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (101, 'Izrada login forme', 'PL/SQL', 2, 4);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (102, 'Testiranje baze podataka', 'SQL', 1, 3);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (103, 'API za upravljanje korisnicima', 'Java', 2, 5);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (104, 'Dizajn korisni�kog su�elja', 'HTML/CSS', 3, 4);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (105, 'Pisanje unit testova', 'Java', 1, 8);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (106, 'Optimizacija SQL upita', 'SQL', 2, 13);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (107, 'Integracija platnog servisa', 'Java', 2, 6);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (108, 'Refaktoriranje koda aplikacije', 'PL/SQL', 3, 9);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (109, 'Izrada tehni�ke dokumentacije', 'Markdown', 1, 18);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (110, 'Dizajn ikona za su�elje', 'HTML/CSS', 2, 12);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (111, 'Priprema migracijskog plana', 'SQL', 3, 7);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (112, 'Razvoj notifikacijskog sustava', 'Java', 2, 10);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (113, 'Analiza sigurnosnih propusta', 'PL/SQL', 1, 14);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (114, 'Uvo�enje CI/CD pipeline-a', 'Java', 2, 17);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (115, 'Razvoj mobilne aplikacije', 'Java', 1, 16);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (116, 'Implementacija autentikacije dvostrukim faktorom', 'Java', 4, 5);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (117, 'Dizajn nove landing stranice', 'HTML/CSS', 4, 16);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (118, 'Migracija podataka na cloud', 'SQL', 5, 19);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (119, 'Pisanje skripti za automatizaciju builda', 'PL/SQL', 5, 17);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (120, 'Razvoj modula za izvje�taje', 'Java', 4, 6);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (121, 'Unapre�enje korisni�ke podr�ke', 'Markdown', 4, 18);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (122, 'Prilagodba aplikacije za mobilne ure�aje', 'HTML/CSS', 5, 12);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (123, 'Testiranje performansi baze', 'SQL', 5, 13);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (124, 'Uvo�enje sustava za verzioniranje', 'Java', 4, 10);
INSERT INTO zadaci (id_zadatak, naziv, programski_jezik, id_status, id_zaposlenik) VALUES (125, 'Osmi�ljavanje strategije sigurnosnih kopija', 'PL/SQL', 4, 14);



INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1001, 101, 'Zapo�eo rad na formi, radi se na validaciji unosa.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1002, 102, 'Priprema testnih podataka.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1003, 103, 'Implementacija CRUD funkcionalnosti.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1004, 104, 'Dizajn zavr�en, �eka se odobrenje.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1005, 105, 'Napisani testovi za osnovne funkcije.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1006, 106, 'Analiza sporih upita u tijeku.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1007, 107, 'Uspostavljena komunikacija s API-em platnog servisa.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1008, 108, 'Kod o�i��en i dokumentiran.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1009, 109, 'Po�etno strukturiranje dokumentacije.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1010, 110, 'Dizajnirane prve ikone.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1011, 111, 'Migracijski plan pripremljen, �eka reviziju.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1012, 112, 'Osnovne notifikacije implementirane.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1013, 113, 'Analiza ranjivosti zapo�eta.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1014, 114, 'Postavljen CI/CD skeleton.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1015, 115, 'Zapo�et rad na backendu.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1020, 116, 'Autentikacija prihva�ena, �eka implementaciju.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1021, 117, 'Dizajn prihva�en od marketing tima.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1022, 118, 'Migracija otkazana zbog rizika gubitka podataka.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1023, 119, 'Automatizacija otkazana zbog prelaska na novo rje�enje.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1024, 120, 'Modul za izvje�taje prihva�en, u fazi planiranja.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1025, 121, 'Podr�ka unaprije�ena, dokumentacija prihva�ena.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1026, 122, 'Prilagodba otkazana zbog promjene prioriteta.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1027, 123, 'Testiranje otkazano zbog nadogradnje baze.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1028, 124, 'Verzioniranje prihva�eno od strane voditelja.');
INSERT INTO aktivnosti_po_zadatku (id_apz, id_zadatak, komentar) VALUES (1029, 125, 'Strategija sigurnosnih kopija prihva�ena.');

