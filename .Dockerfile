FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN useradd -ms /bin/bash --uid 1000 jupyter \
    && apt update \
    && apt install -y python3.8-dev python3.8-distutils curl python3-pip \
    && ln -s /usr/bin/python3.8 /usr/local/bin/python3 \
    && curl https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip install --no-cache-dir torch transformers accelerate bitsandbytes langchain sentence-transformers faiss-gpu openpyxl pacmap datasets langchain-community ragatouille \
    && pip install --no-cache-dir fsspec==2023.6.0 \
    && pip install --no-cache-dir --upgrade pandas \
    && pip install --no-cache-dir --upgrade typing_extensions \
    && pip install --no-cache-dir numpy==1.21 \
    && pip install --no-cache-dir --upgrade h5py \
    && python3 -m pip install --no-cache-dir --upgrade pip

WORKDIR /home/jupyter

USER jupyter

CMD ["bash"]
