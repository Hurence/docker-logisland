FROM hurence/spark

ARG logisland_version=1.0.0-RC2

MAINTAINER hurence

VOLUME ["/logisland"]


RUN cd /tmp; wget https://github.com/Hurence/logisland/releases/download/v${logisland_version}/logisland-${logisland_version}-bin.tar.gz; 
RUN cd /tmp; \
	tar -xzf logisland-*.tar.gz; \
	rm -f /tmp/*.gz; \
	mv logisland-* /opt
RUN cd /opt && ln -s logisland-${logisland_version} logisland
ENV LOGISLAND_HOME /opt/logisland
ENV PATH $PATH:$LOGISLAND_HOME/bin
WORKDIR $LOGISLAND_HOME/

