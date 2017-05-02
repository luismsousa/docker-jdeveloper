FROM oraclelinux:5.11

#install dependencies and make directories
# middleware - jdev install destination
# adf - code mount destination
RUN mkdir -p /usr/oracle/middleware/ && \
	mkdir -p /usr/oracle/adf/ && \
	yum -y install java-1.6.0-openjdk-devel glibc.i686 unzip ant && rm -rf /var/cache/yum/*

WORKDIR /usr/oracle/middleware/

# add silent install file, junit extension and jdev binary
COPY jdevstudio11117install.bin .
COPY silent.xml .
COPY oracle.jdeveloper.junit.zip .

ENV JAVA_HOME /usr/lib/jvm/java-openjdk
ENV MW_HOME /usr/oracle/middleware

# make the jdev binary executable, 
# do silent install
# unzip the JUnit extensiont to the jdev folder
# cleanup files
RUN chmod 744 jdevstudio11117install.bin && \
	./jdevstudio11117install.bin -mode=silent -log=install.log -silent_xml=/usr/oracle/middleware/silent.xml && \
	unzip oracle.jdeveloper.junit.zip -d $MW_HOME/jdeveloper/jdev/extensions && \
	rm -f oracle.jdeveloper.junit.zip && \
	rm -f jdevstudio11117install.bin && \
	rm -f silent.xml 



