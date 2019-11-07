# docker build -t dkyos-ml . 

#Create a hashed password, using the ipython terminal
# from notebook.auth import passwd
#passwd()
#RUN jupyter notebook --generate-config
#RUN echo "c.NotebookApp.password='sha1:***'">>/root/.jupyter/jupyter_notebook_config.py

# FROM [repository]:[tag]
# Dockerfiles for tensorflow
# https://github.com/tensorflow/tensorflow/tree/master/tensorflow/tools/dockerfiles
FROM ubuntu:latest
MAINTAINER DongKyun Yun <dkyun77@gmail.com>

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN apt-get install --no-install-recommends -y \
    # install essentials
    build-essential \
    git \
    vim \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
# install dependencies from python packages
RUN pip --no-cache-dir install -U keras \
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
    bs4 \
    pandas_ml
 
# quick test and dump package lists
#RUN python -c "import tensorflow; print(tensorflow.__version__);"
#RUN python -c "import keras; print(keras.__version__);" 

#RUN /bin/bash <(curl -s https://raw.githubusercontent.com/konlpy/konlpy/master/scripts/mecab.sh)

COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
COPY vimrc /root/.vimrc

#WORKDIR /srv/
#CMD ["jupyter notebook"]
# EXPOSE 8888
