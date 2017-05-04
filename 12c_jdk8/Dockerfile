FROM oraclelinux:7-slim

#install dependencies and make directories
# middleware - jdev install destination
# adf - code mount destination
RUN mkdir -p /usr/oracle/middleware/ && \
	mkdir -p /usr/oracle/adf/ && \
	yum -y install java-1.8.0-openjdk-devel glibc.i686 unzip && \
	yum clean all && rm -rf /var/cache/yum/*

WORKDIR /usr/oracle/middleware/

# add silent install file, junit extension and jdev binary
# TODO figure out the silent install for 12c
COPY jdev_suite_122120_linux64.bin .
COPY silent.xml .

ENV JAVA_HOME /usr/lib/jvm/java-openjdk
ENV MW_HOME /usr/oracle/middleware

# make the jdev binary executable, 
# do silent install
# TODO figure out the silent install for 12c

RUN chmod 744 jdevstudio11117install.bin && \
	./jdevstudio11117install.bin -mode=silent -log=install.log -silent_xml=/usr/oracle/middleware/silent.xml && \
	rm -f jdevstudio11117install.bin && \
	rm -f silent.xml 





