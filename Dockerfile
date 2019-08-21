FROM openjdk:17-slim
LABEL maintainer=frankhjung@linux.com
RUN export TERM=xterm \
 && apt-get --assume-yes --list-cleanup update \
 && apt-get --yes install make docbook docbook-utils
WORKDIR /opt/workspace
CMD /usr/bin/jw --version
