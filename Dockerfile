FROM openjdk:8-jre
RUN groupadd jenkins && useradd -m -g jenkins jenkins && mkdir /home/jenkins/.jenkins

WORKDIR /home/jenkins/

VOLUME /home/jenkins/.jenkins

EXPOSE 8080/tcp 50000/tcp

ADD http://mirrors.jenkins.io/war-stable/latest/jenkins.war /home/jenkins/jenkins.war
COPY entrypoint.sh /home/jenkins/entrypoint.sh
RUN chown -R jenkins:jenkins /home/jenkins/
USER jenkins

ENTRYPOINT /home/jenkins/entrypoint.sh
