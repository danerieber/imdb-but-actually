#!/bin/bash

docker run --name imdb-but-actually -p 5432:5432 -v $(pwd)/data:/data -v $(pwd)/pg-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=docker -d postgres:latest