FROM openjdk:8-jre-slim
MAINTAINER José Bovet Derpich jose.bovet@gmail.com
RUN apt-get update && apt-get install -y --no-install-recommends \
		bzip2 \
		unzip \
		wget \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /opt/sonar

ENV SONAR_RUNNER_VERSION 3.2.0.1227

RUN wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_RUNNER_VERSION}.zip
RUN unzip sonar-scanner-cli-${SONAR_RUNNER_VERSION}.zip
RUN mv /opt/sonar/sonar-scanner-${SONAR_RUNNER_VERSION}/lib/sonar-scanner-cli-${SONAR_RUNNER_VERSION}.jar /opt/sonar/sonar-scanner-cli.jar
RUN chmod 755 /opt/sonar/sonar-scanner-cli.jar

COPY ./runner.sh /bin/
ENTRYPOINT /bin/bash /bin/runner.sh
