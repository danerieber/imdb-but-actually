SELECT 'CREATE DATABASE imdb' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'imdb')\gexec
\c imdb

CREATE SCHEMA indian_movies;
CREATE TABLE indian_movies.basics (
    id            TEXT,
    movie_name    TEXT      NOT NULL,
    year          TEXT,
    timing        TEXT,
    rating        NUMERIC,
    votes         TEXT,
    genre         TEXT,
    language      TEXT      NOT NULL
);
COPY indian_movies.basics
    FROM '/data/extra.csv'
    NULL '-'
    CSV HEADER;

DELETE FROM indian_movies.basics WHERE id in (
    SELECT id FROM indian_movies.basics
    GROUP BY id
    HAVING count(*) > 2;
);