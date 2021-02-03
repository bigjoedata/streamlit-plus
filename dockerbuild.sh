#!/bin/sh
echo Build Stbot which includes Pytorch - CPU only, will need to alter requirements to use GPU
docker build -f Dockerfile_stbot -t intelligentdesigns/streamlit-plus:stbot-latest .

echo Building lighter image
docker build -f Dockerfile -t intelligentdesigns/streamlit-plus:latest .

echo Build heavier image
docker build -f Dockerfile_extra -t intelligentdesigns/streamlit-plus:extra-latest .
