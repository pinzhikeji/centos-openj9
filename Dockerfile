FROM pinzhikeji/centos-zh

RUN wget https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.1%2B13/OpenJDK11U-jdk_x64_linux_openj9_jdk-11.0.1_13_openj9-0.11.0_11.0.1_13.tar.gz -q -O /tmp/openj9.tar.gz \
    && mkdir /usr/local/openj9 \
    && tar -xzvf /tmp/openj9.tar.gz -C /usr/local/openj9/ \
    && mv /usr/local/openj9/jdk-11.0.1+13/* /usr/local/openj9/ \
    && rm -rf /usr/local/openj9/jdk-11.0.1+13/ \
    && rm /tmp/openj9.tar.gz

ENV JAVA_HOME=/usr/local/openj9 \
    JRE_HOME=/usr/local/openj9/jre  \
    TZ=Asia/Shanghai

ENV PATH=$JAVA_HOME/bin:$PATH

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["sh"]