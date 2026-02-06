

CREATE TABLE Aktor 
    ( 
     ID_Aktora NUMBER  NOT NULL , 
     Imie      VARCHAR2 (50) , 
     Nazwisko  VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE Aktor 
    ADD CONSTRAINT Aktor_PK PRIMARY KEY ( ID_Aktora ) ;

CREATE TABLE BIlet 
    ( 
     ID_Biletu       NUMBER  NOT NULL , 
     Nr_Miejsca      NUMBER  NOT NULL , 
     Cena_Finalna    NUMBER (10,2) , 
     Seans_ID_Seansu NUMBER  NOT NULL 
    ) 
;

ALTER TABLE BIlet 
    ADD CONSTRAINT BIlet_PK PRIMARY KEY ( ID_Biletu ) ;

CREATE TABLE Film 
    ( 
     ID_Filmu           NUMBER  NOT NULL , 
     Tytuł              VARCHAR2 (100)  NOT NULL , 
     Reżyser            VARCHAR2 (100) , 
     Czas_Trwania       NUMBER , 
     Gatunek_ID_Gatunku NUMBER  NOT NULL 
    ) 
;

ALTER TABLE Film 
    ADD CONSTRAINT Film_PK PRIMARY KEY ( ID_Filmu ) ;

CREATE TABLE Gatunek 
    ( 
     ID_Gatunku NUMBER  NOT NULL , 
     Nazwa      VARCHAR2 (50)  NOT NULL 
    ) 
;

ALTER TABLE Gatunek 
    ADD CONSTRAINT Gatunek_PK PRIMARY KEY ( ID_Gatunku ) ;

CREATE TABLE Obsada 
    ( 
     Film_ID_Filmu   NUMBER  NOT NULL , 
     Aktor_ID_Aktora NUMBER  NOT NULL 
    ) 
;

ALTER TABLE Obsada 
    ADD CONSTRAINT Relation_4_PK PRIMARY KEY ( Film_ID_Filmu, Aktor_ID_Aktora ) ;

CREATE TABLE Sala 
    ( 
     Nr_Sali      NUMBER  NOT NULL , 
     Ilość_Miejsc NUMBER 
    ) 
;

ALTER TABLE Sala 
    ADD CONSTRAINT Sala_PK PRIMARY KEY ( Nr_Sali ) ;

CREATE TABLE Seans 
    ( 
     ID_Seansu     NUMBER  NOT NULL , 
     Data_Seansu   DATE , 
     Cena_Biletu   NUMBER (10,2) , 
     Film_ID_Filmu NUMBER  NOT NULL , 
     Sala_Nr_Sali  NUMBER  NOT NULL 
    ) 
;

ALTER TABLE Seans 
    ADD CONSTRAINT Seans_PK PRIMARY KEY ( ID_Seansu ) ;

ALTER TABLE BIlet 
    ADD CONSTRAINT BIlet_Seans_FK FOREIGN KEY 
    ( 
     Seans_ID_Seansu
    ) 
    REFERENCES Seans 
    ( 
     ID_Seansu
    ) 
;

ALTER TABLE Film 
    ADD CONSTRAINT Film_Gatunek_FK FOREIGN KEY 
    ( 
     Gatunek_ID_Gatunku
    ) 
    REFERENCES Gatunek 
    ( 
     ID_Gatunku
    ) 
;

ALTER TABLE Obsada 
    ADD CONSTRAINT Relation_4_Aktor_FK FOREIGN KEY 
    ( 
     Aktor_ID_Aktora
    ) 
    REFERENCES Aktor 
    ( 
     ID_Aktora
    ) 
;

ALTER TABLE Obsada 
    ADD CONSTRAINT Relation_4_Film_FK FOREIGN KEY 
    ( 
     Film_ID_Filmu
    ) 
    REFERENCES Film 
    ( 
     ID_Filmu
    ) 
;

ALTER TABLE Seans 
    ADD CONSTRAINT Seans_Film_FK FOREIGN KEY 
    ( 
     Film_ID_Filmu
    ) 
    REFERENCES Film 
    ( 
     ID_Filmu
    ) 
;

ALTER TABLE Seans 
    ADD CONSTRAINT Seans_Sala_FK FOREIGN KEY 
    ( 
     Sala_Nr_Sali
    ) 
    REFERENCES Sala 
    ( 
     Nr_Sali
    ) 
;


