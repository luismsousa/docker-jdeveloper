FROM oraclelinux:7.3

MAINTAINER "Subodh Hatkar" <subodh.hatkar@accenture.com>

RUN mkdir -p /usr/oracle/middleware \
    /usr/oracle/adf \
    /usr/java \
    /usr/apache

WORKDIR /usr/oracle/middleware/

COPY jdk-8u131-linux-x64.tar.gz \
     apache-maven-3.5.0-bin.tar.gz \
     jdev_suite_122100.jar \
     jDevResponseFile \
     oraInst.loc ./

ENV JAVA_HOME /usr/java/jdk1.8.0_131/jre
ENV MW_HOME /usr/oracle/middleware
ENV M2_HOME /usr/apache/apache-maven-3.5.0
ENV ORACLE_HOME /usr/oracle/middleware/oracle_home
ENV PATH $PATH:$M2_HOME/bin:$JAVA_HOME/bin:$ORACLE_HOME/bin

# putting it all in one run to shave 2GB of the intermediate layers
# 1. untar the jdk and maven archives
# 2. create the oracle user
# 3. install the jdeveloper in ilent mode
# 4. cleanup

RUN tar -xvf ./jdk-8u131-linux-x64.tar.gz -C /usr/java && \
    tar -xvf ./apache-maven-3.5.0-bin.tar.gz -C /usr/apache && \
    useradd oracle && \
    chown -R oracle:oracle /usr/oracle && \
    su oracle -c "java -jar jdev_suite_122100.jar \
    -silent -responseFile /usr/oracle/middleware/jDevResponseFile \
    -invPtrLoc /usr/oracle/middleware/oraInst.loc" && \
    rm -rf jdev_suite_1221202.jar \
    jdk-8u131-linux-x64.tar.gz \
    apache-maven-3.5.0-bin.tar.gz \
    jDevResponseFile oraInst.loc
