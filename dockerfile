
FROM centos:7 

ENV JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=144 \
    JAVA_VERSION_BUILD=01 \
    JAVA_URL_HASH=090f390dda5b47b9b721c7dfaa008135


RUN yum install -y wget && \
    yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel git && \
    yum install -y xeyes && \
    yum install -y krb5-workstation && \
    yum clean all

# Set environment variables.
ENV HOME /root
ENV JDK_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64
ENV JAVA_EXE /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre/bin/java
ENV JRE_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre
ENV LANG C.UTF-8


# Install IntelliJ Community
RUN set -ex && \
    wget https://download.jetbrains.com/idea/ideaIC-2019.2.3-no-jbr.tar.gz && \
    tar -xf ideaIC-2019.2.3-no-jbr.tar.gz && \
    rm ideaIC-2019.2.3-no-jbr.tar.gz

RUN yum install -y xauth xlist

#ARG USER_ID=1000
#ARG GROUP_ID=1000

#RUN groupadd -g ${GROUP_ID} intellij && useradd -l -u ${USER_ID} -g intellij intellij
#USER intellij

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
