FROM java:8-jre

MAINTAINER Daniel Sturm <mail@danielsturm.de>

RUN set -x \
 && apt-get update \
 && apt-get install -y \
    gnupg \
    apt-transport-https \
 && echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 \
 && apt-get update \
 && apt-get install -y \
    sbt

ENV HOME "/cache"

VOLUME ["/cache", "/sbt"]
WORKDIR /sbt

ENTRYPOINT ["sbt", "-sbt-dir", "/cache/.sbt/", "-sbt-boot", "/cache/.sbt/boot", "-ivy", "/cache/.ivy2/"]
