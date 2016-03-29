
# Base Settings
FROM ubuntu:14.04
MAINTAINER TAC tac0x2a

USER root

## packages
RUN apt-get update -y
RUN apt-get install curl zsh -y
RUN apt-get install build-essential libssl-dev -y

## change root password
RUN echo 'root:devenv' |chpasswd # change root password to 'devenv'

## add user 'devenv:devenv'
RUN useradd -m devenv \
    && echo "devenv ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo 'devenv:devenv' | chpasswd
RUN chsh -s /usr/bin/zsh devenv


# Make devenv
USER devenv
WORKDIR /home/devenv
ENV HOME /home/devenv

# Node.js (nvm)
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
ENV NODE_VERSION 5.9.0
ENV NVM_DIR $HOME/.nvm
RUN . ~/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && npm install -g express
RUN echo ". ~/.nvm/nvm.sh" >> ~/.bashrc

# Application Volumes
RUN mkdir /home/devenv/work

# Run Application
ENTRYPOINT cd /home/devenv/work && . ~/.nvm/nvm.sh && nvm use $NODE_VERSION && npm install && npm start
