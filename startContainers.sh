docker run --detach \
--hostname gitlab.dcloud.cisco.com \
--publish 5443:443 --publish 5080:80 --publish 5022:22 \
--name gitlab \
--restart always \
--volume /srv/gitlab/config:/etc/gitlab:Z \
--volume /srv/gitlab/logs:/var/log/gitlab:Z \
--volume /srv/gitlab/data:/var/opt/gitlab:Z \
gitlab/gitlab-ce:latest


export ARTIFACTORY_HOME=/var/opt/jfrog/artifactory

docker run --name artifactory \
--publish 8081:8081 \
--volume $ARTIFACTORY_HOME/data \
--volume $ARTIFACTORY_HOME/logs \
--volume $ARTIFACTORY_HOME/backups \
--volume $ARTIFACTORY_HOME/etc \
jfrog-docker-reg2.bintray.io/jfrog/artifactory-oss


docker run --name myjenkins \
--publish 8080:8080 \
--publish 5000:5000 \
--volume /var/jenkins_home \
jenkins

  

