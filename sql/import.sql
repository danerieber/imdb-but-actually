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

CREATE TABLE title.crew (
    tconst              TEXT        PRIMARY KEY,
    directors           TEXT,
    writers             TEXT
);
COPY title.crew
    FROM '/data/title.crew.tsv'
    DELIMITER E'\t'
    NULL '\N'
    CSV HEADER;

CREATE TABLE title.episode (
    tconst               TEXT        PRIMARY KEY,
    parent_tconst        TEXT,
    season_number        INT,
    episode_number       INT
);
COPY title.episode
    FROM '/data/title.episode.tsv'
    DELIMITER E'\t'
    NULL '\N'
    CSV HEADER;

CREATE TABLE title.principals (
    tconst              TEXT        NOT NULL,
    ordering            INT         NOT NULL,
    nconst              TEXT        NOT NULL,
    category            TEXT,
    job                 TEXT,
    characters          TEXT,
    PRIMARY KEY(tconst, ordering)
);
COPY title.principals
    FROM '/data/title.principals.tsv'
    DELIMITER E'\t'
    NULL '\N'
    CSV HEADER;

CREATE TABLE title.ratings (
    tconst              TEXT        PRIMARY KEY,
    average_rating      REAL,
    num_votes           INT
);
COPY title.ratings
    FROM '/data/title.ratings.tsv'
    DELIMITER E'\t'
    NULL '\N'
    CSV HEADER;

CREATE TABLE title.basics (
    tconst              TEXT        PRIMARY KEY,
    title_type          TEXT        NOT NULL,
    primary_title       TEXT,
    original_title      TEXT,
    is_adult            INT,
    start_year          INT,
    end_year            INT,
    runtime_minutes     INT,
    genres              TEXT
);
COPY title.basics
    FROM '/data/title.basics.tsv'
    DELIMITER E'\t'
    NULL '\N'
    CSV HEADER;