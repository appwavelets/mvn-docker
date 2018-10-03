FROM maven:3.5.4-jdk-8

RUN apt-get update && apt-get install --no-install-recommends -y \
  make && \
  rm -rf /var/lib/apt/lists/*

COPY settings.xml /root/.m2/settings.xml
COPY docker-entrypoint.sh /usr/local/bin/

WORKDIR /workspace

ENTRYPOINT ["docker-entrypoint.sh"]
