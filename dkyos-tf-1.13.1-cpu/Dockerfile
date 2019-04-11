# docker build -t dkyos-ml . 

#Create a hashed password, using the ipython terminal
# from notebook.auth import passwd
#passwd()
#RUN jupyter notebook --generate-config
#RUN echo "c.NotebookApp.password='sha1:***'">>/root/.jupyter/jupyter_notebook_config.py

# FROM [repository]:[tag]
# Dockerfiles for tensorflow
# https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/dockerfiles
FROM tensorflow/tensorflow:1.13.1-py3-jupyter
MAINTAINER DongKyun Yun <dkyun77@gmail.com>
 
# install dependencies from debian packages

RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update

RUN apt-get install --no-install-recommends -y \
    # install essentials
    build-essential \
    g++ \
    git \
    vim \
    openssh-client \
    # install python
    python-dev \
    python-pip \
    python-setuptools \
    python-virtualenv \
    python-wheel \
    pkg-config \
    python-matplotlib \
    python3-tk \
    python-pillow \
    # requirements for numpy
    libopenblas-base \
    python-numpy \
    python-scipy \
    # requirements for keras
    python-h5py \
    python-yaml \
    python-pydot \
    openjdk-8-jdk \
    python3-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
# install dependencies from python packages
RUN pip --no-cache-dir install -U keras \
    lime \
    shap \
    eli5 \
    xgboost \
    gensim \
    pandas \
    scikit-learn \
    statsmodels \
    jupyter \
    seaborn \
    pydot \
    numpy \
    scipy \
    sklearn \
    scikit-image \
    matplotlib \
    Cython \
    requests \
    opencv-python \
    konlpy \
    nltk \
    bert-serving-server \
    bert-serving-client \
    pandas_ml
 
# quick test and dump package lists
#RUN python -c "import tensorflow; print(tensorflow.__version__);"
#RUN python -c "import keras; print(keras.__version__);" 

RUN /bin/bash <(curl -s https://raw.githubusercontent.com/konlpy/konlpy/master/scripts/mecab.sh)

COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
COPY vimrc /root/.vimrc

#WORKDIR /srv/
#CMD ["jupyter notebook"]
# EXPOSE 8888
