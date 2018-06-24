FROM openjdk:8-jre
RUN groupadd jenkins && useradd -m -g jenkins jenkins && mkdir /home/jenkins/.jenkins && chown -R jenkins:jenkins /home/jenkins/.jenkins
USER jenkins
WORKDIR /home/jenkins/
VOLUME /home/jenkins/.jenkins

EXPOSE 8080/tcp
EXPOSE 50000/tcp
ADD --chown=jenkins:jenkins http://mirrors.jenkins.io/war-stable/latest/jenkins.war /home/jenkins/jenkins.war

COPY --chown=jenkins:jenkins entrypoint.sh /home/jenkins/entrypoint.sh

ENTRYPOINT /home/jenkins/entrypoint.sh
