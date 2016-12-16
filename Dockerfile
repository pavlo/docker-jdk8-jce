FROM ubuntu:trusty

RUN \
  apt-get update && \
  apt-get install --no-install-recommends curl unzip software-properties-common -y && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y --no-install-recommends oracle-java8-installer &&\
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \
  curl -LO "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" -H 'Cookie: oraclelicense=accept-securebackup-cookie' && \
  unzip jce_policy-8.zip && \
  rm jce_policy-8.zip && \
  yes |cp -v ./UnlimitedJCEPolicyJDK8/*.jar /usr/lib/jvm/java-8-oracle/jre/lib/security/


ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
