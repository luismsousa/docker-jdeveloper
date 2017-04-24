FROM oraclelinux:5.11


RUN mkdir -p /usr/oracle/middleware/ && \
	mkdir -p /usr/oracle/adf/ && \
	yum -y install java-1.6.0-openjdk-devel glibc.i686 ant && rm -rf /var/cache/yum/*

WORKDIR /usr/oracle/middleware/

COPY jdevstudio11117install.bin .
COPY silent.xml .

ENV JAVA_HOME /usr/lib/jvm/java-openjdk
ENV MW_HOME /usr/oracle/middleware

RUN chmod 744 jdevstudio11117install.bin && \
	./jdevstudio11117install.bin -mode=silent -log=install.log -silent_xml=/usr/oracle/middleware/silent.xml && \
	rm -f jdevstudio11117install.bin && \
	rm -f silent.xml
