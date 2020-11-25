#!/bin/sh
echo Building lighter image
docker build -f Dockerfile -t intelligentdesigns/streamlit-plus:latest .

echo Build heavier image
docker build -f Dockerfile_extra -t intelligentdesigns/streamlit-plus-extra:latest .
