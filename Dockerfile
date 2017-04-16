
# Base Settings
FROM node:7.9.0-alpine
MAINTAINER TAC tac0x2a

# Make devenv
WORKDIR /home/devenv
ENV HOME /home/devenv

# Application Volumes
RUN mkdir /home/devenv/witchcoder
VOLUME /home/devenv/witchcoder

# Run Application
ENTRYPOINT cd /home/devenv/witchcoder && npm start
