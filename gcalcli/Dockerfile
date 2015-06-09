<<<<<<< 4edfd82ae145246eb19c296d149a121852cfb6e9
FROM alpine:latest
LABEL maintainer "Jessie Frazelle <jess@linux.com>"

ENV HOME /home/gcalcli

RUN apk --no-cache add \
	python \
	python-dev \
	py2-pip \
	build-base \
	&& adduser -S gcalcli \
	&& chown -R gcalcli $HOME \
	&& pip install vobject parsedatetime gcalcli
=======
FROM python:2.7.8
MAINTAINER Jessica Frazelle <jess@docker.com>

ENV HOME /home/gcalcli
RUN useradd --create-home --home-dir $HOME gcalcli \
	&& chown -R gcalcli:gcalcli $HOME

RUN pip install vobject parsedatetime gcalcli
>>>>>>> add gcalcli, itunes, update spotify-wine

WORKDIR $HOME
USER gcalcli

<<<<<<< 4edfd82ae145246eb19c296d149a121852cfb6e9
ENTRYPOINT [ "gcalcli" ]
=======
ENTRYPOINT [ "/usr/local/bin/gcalcli" ]
>>>>>>> add gcalcli, itunes, update spotify-wine
