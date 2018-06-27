FROM openjdk:8-jre
RUN groupadd jenkins && useradd -m -g jenkins jenkins && mkdir /home/jenkins/.jenkins && apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/jenkins/

VOLUME /home/jenkins/.jenkins

EXPOSE 8080/tcp 50000/tcp

ADD http://mirrors.jenkins.io/war-stable/latest/jenkins.war /home/jenkins/jenkins.war
COPY entrypoint.sh /home/jenkins/entrypoint.sh
RUN chown -R jenkins:jenkins /home/jenkins/
USER jenkins

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

ENTRYPOINT /home/jenkins/entrypoint.sh
