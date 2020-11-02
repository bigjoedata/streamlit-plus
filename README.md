# streamlit-plus
For a quickstart with a basic "Hello World" app, run the following and visit port 8080:

    docker run -p 8080:8080 -e STREAMLIT_SERVER_PORT=8080 --restart always intelligentdesigns/streamlit-plus:latest

See an implementation of my own site running on Oracle Cloud free tier at https://partytruths.com

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

To roll your own image and/or customize do the following. I have included documentation and examples:

    git clone https://github.com/bigjoedata/streamlit-plus
    cd streamlit-plus
    nano requirements.txt # Change dependencies as needed
    nano Dockerfile # Change options as needed
    nano docker-compose.yml # point the bind mount for /app to your own app folder. As part of the magic of Streamlit, any changes to the folder will be immedialey reflected in your Streamlit app.
    docker build -t .

Note: I have built this as a multi-stage build to try to keep the size down, however it is still ~256MB compressed / 950MB uncompressed. This package includes many dependencies which inflate the size. Some required packages are large such as Pyarrow which is a Streamlit dependency and > 200MB alone. For additional efficiency, you may recompile many of these. The base image is not Alpine so the intrepid optimizer has many available options.
