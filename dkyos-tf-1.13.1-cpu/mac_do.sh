#!/usr/bin/env bash

# Output colors
NORMAL="\\033[0;39m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"

# Names to identify images and containers of this app
IMAGE_NAME='dkyos-tf-1.13.1-cpu'
CONTAINER_NAME="dkyos-tf-1.13.1-cpu"

# Usefull to run commands as non-root user inside containers
USER="dkyos"
HOMEDIR="/home/$USER"
#LOCAL_SRC="/Users/dongkyun.yun/dkyos"
LOCAL_SRC="/Users/dongkyun.yun/Desktop/공유/OneDrive/dkyos"
CONTAINER_SRC="/tf/dkyos"
EXECUTE_AS="sudo -u dkyos HOME=$HOME_DIR"

log() {
    echo -e "$BLUE > $1 $NORMAL"
}

error() {
    echo ""
    echo -e "$RED >>> ERROR - $1$NORMAL"
}

build() {
    if [ -z "${http_proxy}" ]
    then
        docker build -t $IMAGE_NAME .
    else
        echo -e "http_proxy=${http_proxy}"
        echo -e "https_proxy=${https_proxy}"
        docker build -t $IMAGE_NAME \
            --build-arg http_proxy="${http_proxy}" \
            --build-arg https_proxy="${https_proxy}" \
            .
    fi

    [ $? != 0 ] && \
    error "Docker image build failed !" && exit 100
}

hello() {
    log "RUN hello"
    docker run hello-world

    [ $? != 0 ] && error "failed !" && exit 101
}

run() {
    log "RUN"
    docker rm $IMAGE_NAME 
    if [ -z "${http_proxy}" ]
    then
        docker run \
            --name=$IMAGE_NAME \
            -it \
            -p 8888:8888 \
            -v $LOCAL_SRC:$CONTAINER_SRC \
            -v $(pwd)/.cache:/root/.cache \
            -v $(pwd)/.config:/root/.config \
            -v $(pwd)/.gnupg:/root/.gnupg \
            -v $(pwd)/.ipython:/root/.ipython \
            -v $(pwd)/.keras:/root/.keras \
            -v $(pwd)/.local:/root/.local \
            -v $(pwd)/.nv:/root/.nv \
            $IMAGE_NAME:latest
    else
        echo -e "http_proxy=${http_proxy}"
        echo -e "https_proxy=${https_proxy}"
        docker run \
            --name=$IMAGE_NAME \
            -it \
            -p 8888:8888 \
            --env http_proxy="${http_proxy}" \
            --env https_proxy="${https_proxy}" \
            -v $LOCAL_SRC:$CONTAINER_SRC \
            -v $(pwd)/.cache:/root/.cache \
            -v $(pwd)/.config:/root/.config \
            -v $(pwd)/.gnupg:/root/.gnupg \
            -v $(pwd)/.ipython:/root/.ipython \
            -v $(pwd)/.keras:/root/.keras \
            -v $(pwd)/.local:/root/.local \
            -v $(pwd)/.nv:/root/.nv \
            $IMAGE_NAME:latest
    fi

    [ $? != 0 ] && error "Npm install failed !" && exit 101
}

bash() {
    log "BASH"
    docker exec -it $IMAGE_NAME /bin/bash
}

stop() {
    docker stop $CONTAINER_NAME
}

start() {
    docker start $CONTAINER_NAME
}

remove() {
    log "Removing previous container $CONTAINER_NAME" && \
    docker rm -f $CONTAINER_NAME &> /dev/null || true
}

help() {
    echo "--------------------"
    echo " Available commands"
    echo "--------------------"
    echo -e -n "$BLUE"
    echo "   > build - To build the Docker image"
    echo "   > run - To run the Docker image"
    echo "   > stop - To stop container"
    echo "   > start - To start container"
    echo "   > bash - Log you into container"
    echo "   > remove - Remove container"
    echo "   > help - Display this help"
    echo -e -n "$NORMAL"
    echo "------------------"
}

$*
