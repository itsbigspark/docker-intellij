# Alpine 3.8 C++/Java Developer Image
#
# For IntelliJ and GUI (X11), run the image with:
# $ XSOCK=/tmp/.X11-unix && sudo docker run -i -v $XSOCK:$XSOCK --volume="$HOME/.Xauthority:/root/.Xauthority:rw" -e DISPLAY -u developer -t [image-name]
#
# Then run IntelliJ with:
# /idea-IC-191.6707.61/bin/idea.sh

FROM alpine:3.8

ENV LANG C.UTF-8

RUN set -ex && \
    apk add --no-cache --update \
    # basic packages
        bash bash-completion coreutils file grep openssl openssh nano sudo tar xz \
    # debug tools
        gdb musl-dbg strace \
    # docs and man
        bash-doc man man-pages less less-doc \
    # GUI fonts
        font-noto \
    # user utils
        shadow

RUN set -ex && \
    apk add --no-cache --update \
    # C++ build tools
        cmake g++ git linux-headers libpthread-stubs make

RUN set -ex && \
    apk add --no-cache --update \
    # Java tools
        gradle openjdk8 openjdk8-dbg

# Install IntelliJ Community
RUN set -ex && \
    wget https://download.jetbrains.com/idea/ideaIC-2019.2.3-no-jbr.tar.gz && \
    tar -xf ideaIC-2019.2.3-no-jbr.tar.gz && \
    rm ideaIC-2019.2.3-no-jbr.tar.gz

# Set additional environment variables
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV JDK_HOME  /usr/lib/jvm/java-1.8-openjdk
ENV JAVA_EXE  /usr/lib/jvm/java-1.8-openjdk/bin/java
