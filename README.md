# streamlit-plus
A batteries included docker build including [Streamlit](https://www.streamlit.io/) + Visualization Tools + Other key tools

For a quickstart with a basic "Hello World" app, run the following and visit port 8080:

    docker run -p 8080:8080 -e STREAMLIT_SERVER_PORT=8080 --restart always intelligentdesigns/streamlit-plus:latest

To customize, clone this repository, and edit the docker-compose.yml to point the bind mount for /app to your own app folder. Instructions included in docker-compose.yml

Key packages included:
**Viz**
- [Streamlit](https://www.streamlit.io/)
- Bokeh
- Altair
- Plotly
- Seaborn
- Matplotlib

**Utils** 
- Numpy
- Pandas 
- SciKitLearn
- Oauthlib
- Quandl
- Pillow
- Fastcluster
- Gspread

And more. See requirements.txt for versions and full list of included packages. 

Note: I have built this as a multi-stage build to try to keep the size down, however it is still ~256MB compressed / 950MB uncompressed. This package includes many dependencies which inflate the size. You can roll your own by editing the requirements.txt and rebuilding, but some required packages are large such as Pyarrow which is a Streamlit dependency and > 200MB alone. 
