{\rtf1\ansi\ansicpg1250\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Widok 1: Aktualny Repertuar z informacj\uc0\u261  o sali\
CREATE OR REPLACE VIEW V_Repertuar AS\
SELECT \
    f.Tytu\uc0\u322 ,\
    g.Nazwa AS Gatunek,\
    s.Data_Seansu,\
    sa.Nr_Sali,\
    sa.Ilo\uc0\u347 \u263 _Miejsc,\
    s.Cena_Biletu AS Cena_Bazowa\
FROM Seans s\
JOIN Film f ON s.Film_ID_Filmu = f.ID_Filmu\
JOIN Gatunek g ON f.Gatunek_ID_Gatunku = g.ID_Gatunku\
JOIN Sala sa ON s.Sala_Nr_Sali = sa.Nr_Sali;\
\
-- Widok 2: Raport Finansowy (Przych\'f3d na film)\
CREATE OR REPLACE VIEW V_Przychody_Filmow AS\
SELECT \
    f.Tytu\uc0\u322 ,\
    COUNT(b.ID_Biletu) AS Sprzedane_Bilety,\
    SUM(b.Cena_Finalna) AS Laczny_Przychod\
FROM Film f\
JOIN Seans s ON f.ID_Filmu = s.Film_ID_Filmu\
JOIN BIlet b ON s.ID_Seansu = b.Seans_ID_Seansu\
GROUP BY f.Tytu\uc0\u322 ;\
\
-- Widok 3: Informacje o Obsadzie\
CREATE OR REPLACE VIEW V_Obsada_Info AS\
SELECT \
    a.Imie || ' ' || a.Nazwisko AS Aktor,\
    f.Tytu\uc0\u322  AS Film,\
    g.Nazwa AS Gatunek,\
    f.Re\uc0\u380 yser\
FROM Aktor a\
JOIN Obsada o ON a.ID_Aktora = o.Aktor_ID_Aktora\
JOIN Film f ON o.Film_ID_Filmu = f.ID_Filmu\
JOIN Gatunek g ON f.Gatunek_ID_Gatunku = g.ID_Gatunku;\
\
-- Widok 4: Szczeg\'f3\uc0\u322 y sprzedanych bilet\'f3w\
CREATE OR REPLACE VIEW V_Bilety_Detale AS\
SELECT \
    b.ID_Biletu,\
    f.Tytu\uc0\u322 ,\
    s.Data_Seansu,\
    b.Nr_Miejsca,\
    b.Cena_Finalna\
FROM Bilet b\
JOIN Seans s ON b.Seans_ID_Seansu = s.ID_Seansu\
JOIN Film f ON s.Film_ID_Filmu = f.ID_Filmu;}