FROM shimtom/anaconda3-ubuntu:latest

MAINTAINER shimtom

RUN apt-get update && apt-get install -y --no-install-recommends \
        make \
        cmake \
        build-essential \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        llvm \
        libgtk2.0-0 \
        libncurses5-dev \
        libncursesw5-dev \
        libpng-dev \
    && apt-get clean

# Set up Japanese environment
RUN apt-get update && apt-get install -y language-pack-ja && \
    update-locale LANG=ja_JP.UTF-8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install packages with conda
RUN conda install -y -c conda-forge jupyter_contrib_nbextensions
RUN conda install -y -c conda-forge tqdm
RUN conda install -y -c menpo opencv3
RUN conda install -y -c conda-forge plotly=2.0.12
RUN conda install -y scikit-learn

# Install packages with pip
RUN pip --no-cache-dir install \
        yapf \
        keras \
        graphviz \
        tensorflow

COPY run_jupyter.sh /

COPY jupyter_notebook_config.py /root/.jupyter/

EXPOSE 8888

VOLUME /home

WORKDIR /home

CMD ["/run_jupyter.sh", "--allow-root"]
