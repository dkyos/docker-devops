# docker build -t tf-keras . 
FROM tensorflow/tensorflow:1.12.0-gpu-py3
 
# Start time
RUN echo '================start================'
RUN date
RUN echo '================start================'
 
# install dependencies from debian packages
RUN apt-get update
RUN apt-get update -qq \
 && apt-get install --no-install-recommends -y \
    # install essentials
    build-essential \
    g++ \
    git \
    openssh-client \
    # install python
    python \
    python-dev \
    python-pip \
    python-setuptools \
    python-virtualenv \
    python-wheel \
    pkg-config \
    python-matplotlib \
    python-pillow \
    # requirements for numpy
    libopenblas-base \
    python-numpy \
    python-scipy \
    # requirements for keras
    python-h5py \
    python-yaml \
    python-pydot \
    python3-tk \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
# install dependencies from python packages
RUN pip --no-cache-dir install -U keras \
    lime \
    shap \
    xgboost \
    gensim \
    pandas \
    scikit-learn \
    statsmodels \
    jupyter \
    seaborn \
    pandas_ml
 
# quick test and dump package lists
#RUN python -c "import tensorflow; print(tensorflow.__version__); import keras; print(keras.__version__);" 

#WORKDIR /srv/
 
# End time
RUN echo '================end================'
RUN date
RUN echo '================end================'
 
