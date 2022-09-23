CREATE DATABASE imdb;
\c imdb

CREATE SCHEMA name;
CREATE TABLE name.basics (
    nconst              TEXT        PRIMARY KEY,
    primary_name        TEXT        NOT NULL,
    birth_year          INT,
    death_year          INT,
    primary_profession  TEXT,
    known_for_titles    TEXT
);
COPY name.basics
    FROM '/data/name.basics.tsv'
    DELIMITER E'\t'
    NULL '\N'
    CSV HEADER;

CREATE SCHEMA title;
CREATE TABLE title.akas (
    title_id            TEXT        NOT NULL,
    ordering            INT         NOT NULL,
    title               TEXT        NOT NULL,
    region              TEXT,
    language            TEXT,
    types               TEXT,
    attributes          TEXT,
    is_original_title   INT,
    PRIMARY KEY(title_id, ordering)
);
COPY title.akas
    FROM '/data/title.akas.tsv'
    DELIMITER E'\t'
    NULL '\N'
    CSV HEADER;