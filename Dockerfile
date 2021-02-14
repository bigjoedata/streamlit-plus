FROM python:3.8-slim-buster AS builder
ENV PATH=/root/.local:/root/.local/bin:/install:$PATH

# Change the requirements.txt if you want to add/change tools, though I recommend against since PIP can be difficult to disentangle
WORKDIR app
RUN pip install --upgrade pip
RUN pip install --user --upgrade  streamlit matplotlib plotly seaborn \
streamlit-embedcode streamlit-bokeh-events st-annotated-text  \
plotnine smart-open convertdate streamlit-vega-lite pydeck
# gspread quandl oauth2client oauthlib # Removed
# scipy scikit-learn pandas-profiling[notebook] streamlit-pandas-profiling # moved to extra build
#Simple sample app is in src folder. Bind mount another folder to /app to inject your own app.
COPY src /app

# We are doing a 2-stage build to make it lighter
FROM python:3.8-slim-buster AS app
COPY --from=builder /root/.local /root/.local
COPY --from=builder /app/main.py /app/main.py
ENV PATH=/root/.local:/root/.local/bin:$PATH

# streamlit-specific commands for config
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
# We are not using the Streamlit default of 8501 so make sure to set an environmental variable when deploying of "STREAMLIT_SERVER_PORT=8080"
EXPOSE 8080
# Uncomment the next line if you want to use Streamlit's default port
# EXPOSE 8501

# Set default folder as /app
WORKDIR app

# Run Streamlit automatically when container is run
CMD streamlit run main.py
