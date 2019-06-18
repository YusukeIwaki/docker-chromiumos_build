FROM debian:buster

RUN apt-get update && apt-get install -y \
      git-core \
      gitk \
      git-gui \
      gnupg \
      curl \
      lvm2 \
      thin-provisioning-tools \
      python-pkg-resources \
      python-virtualenv \
      python-oauth2client

RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /opt/depot_tools
ENV PATH $PATH:/opt/depot_tools

RUN mkdir /chromiumos /script
COPY download.sh /script/download.sh
COPY build.sh /script/build.sh
RUN chmod 755 /script/*.sh

RUN useradd -d /chromiumos builder
RUN chown -R builder:builder /chromiumos
USER builder

ENV BOARD amd64-generic
