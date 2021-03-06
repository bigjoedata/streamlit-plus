# streamlit-plus
A batteries included docker build including [Streamlit](https://www.streamlit.io/) + Visualization Tools + Other key tools

**Update: Now lighter running using Pip dependency resolver (without requirements.txt version pinning)**

For a quickstart, run:

    docker run -p 8080:8080 -e STREAMLIT_SERVER_PORT=8080 --restart always intelligentdesigns/streamlit-plus:latest

To run with your own app:
Install [Docker Compose](https://docs.docker.com/compose/install/)

Follow the following

    git clone https://github.com/bigjoedata/streamlit-plus
    cd streamlit-plus
    nano docker-compose.yml # point the bind mount for /app to your own app folder. As part of the magic of Streamlit, any changes to the folder will be immedialey reflected in your Streamlit
    docker-compose up -d # launch in daemon (background) mode

To build your own, follow the above directions.

    nano Dockerfile # Change options if needed. Use Dockerfile_minimal, Dockerfile_extra or Dockerfile_stbot depending on what you edited above
    docker build -f Dockerfile -t streamlit-plus:latest . # Build the Dockerfile you edited above and change tag name similarly

Key packages include:
**Streamlit Components**
- streamlit-embedcode
- streamlit-bokeh-events
- st-annotated-text
- Streamlit-vega-lite

**Viz**
- [Streamlit](https://www.streamlit.io/)
- Bokeh
- Altair
- Plotly
- Seaborn
- Matplotlib
- Plotnine
- Pydeck

**Utils**
- Numpy
- Pandas
- Pillow
- Fastcluster

**The Container Tagged "Extra" includes:**
- SciKitLearn
- Scipy
- streamlit-pandas-profiling (and Pandas Profiling)
- Pycaret
- Hiplot
- Streamlit-observable
- Spacy & Spacy-streamlit
- Streamlit-folium
- Facebook Prophet

**The Container Tagged "stbot" only includes:**
- Pytorch (CPU only)
- [Transformers](https://github.com/huggingface/transformers)
- [AITextgen](https://github.com/minimaxir/aitextgen)  

**The Container Tagged "minimal" only includes Streamlit**

**Removed in latest build**
- Oauthlib
- Quandl
- Gspread
And more. See Dockerfiles for list of included packages, which will include dependencies..

Note: I have built this as a multi-stage build to try to keep the size down, however it is still ~256MB compressed / 950MB uncompressed. This package includes many dependencies which inflate the size. You can roll your own by editing the requirements.txt and rebuilding, but some required packages are large such as Pyarrow which is a Streamlit dependency and > 200MB alone. 
