# imdb-but-actually

IMDb, but it's actually a database (using postgres)

## Steps

1. `./download.sh` - download tsv files from IMDb
1. `./parse.sh` - format tsv files for import with postgres
1. `docker run --name imdb-but-actually -p 5432:5432 -v $(pwd)/data:/data -v $(pwd)/pg-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=docker -d postgres:latest` - spawn postgres container (optional if you already have a postgres DB)
1. `psql -h localhost -U postgres -f sql/import.sql` - use sql script to create database and import data (takes a long time)

Replace the postgres password "docker" with a strong password of your choice.

## Extra Data

The data in `data/extra.csv` contains a list of Indian movies found on Kaggle: [link](https://www.kaggle.com/datasets/nareshbhat/indian-moviesimdb?resource=download)