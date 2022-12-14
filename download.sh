#!/bin/bash

mkdir data
cd data

if which wget >/dev/null ; then
    wget https://datasets.imdbws.com/name.basics.tsv.gz
    wget https://datasets.imdbws.com/title.akas.tsv.gz
    wget https://datasets.imdbws.com/title.basics.tsv.gz
    wget https://datasets.imdbws.com/title.crew.tsv.gz
    wget https://datasets.imdbws.com/title.episode.tsv.gz
    wget https://datasets.imdbws.com/title.principals.tsv.gz
    wget https://datasets.imdbws.com/title.ratings.tsv.gz
elif which curl >/dev/null ; then
    curl https://datasets.imdbws.com/name.basics.tsv.gz --output name.basics.tsv.gz
    curl https://datasets.imdbws.com/title.akas.tsv.gz --output title.akas.tsv.gz
    curl https://datasets.imdbws.com/title.basics.tsv.gz --output title.basics.tsv.gz
    curl https://datasets.imdbws.com/title.crew.tsv.gz --output title.crew.tsv.gz
    curl https://datasets.imdbws.com/title.episode.tsv.gz --output title.episode.tsv.gz
    curl https://datasets.imdbws.com/title.principals.tsv.gz --output title.principals.tsv.gz
    curl https://datasets.imdbws.com/title.ratings.tsv.gz --output title.ratings.tsv.gz
else
    echo "Download failed. Missing curl or wget."
fi

gunzip ./*
