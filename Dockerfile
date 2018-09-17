FROM continuumio/miniconda3

# docker build -t openbases/builder-bioschema
# docker run -v $PWD:/data openbases/builder-bioschema
RUN apt-get update && apt-get install -y git wget
RUN mkdir -p /code
ADD . /code
WORKDIR /code
RUN /opt/conda/bin/pip install -r /code/requirements.txt && \
    /opt/conda/bin/python setup.py install
ENTRYPOINT ["/opt/conda/bin/python", "/code/run.py"]
