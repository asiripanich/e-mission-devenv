# download base image
# python 2
# FROM continuumio/anaconda
# python 3
FROM continuumio/anaconda3

# set working directory
WORKDIR /usr/src/app

# clone from repo
RUN git clone https://github.com/e-mission/e-mission-server.git .

# setup python environment
# ADD dk_app_dependencies_setup.sh /usr/src/app/dk_app_dependencies_setup.sh
# RUN chmod u+x /usr/src/app/dk_app_dependencies_setup.sh
# RUN /bin/bash /usr/src/app/dk_app_dependencies_setup.sh
RUN conda env update --name emission --file setup/environment36.yml
RUN /bin/bash -c "source activate emission; pip install six --upgrade"

# install nodejs, npm and bower
RUN apt-get update
RUN apt-get install -y build-essential cron
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get -y install nodejs
RUN npm install -g bower
WORKDIR /usr/src/app/webapp
RUN bower update --allow-root
WORKDIR /usr/src/app

# install nano for editing
RUN apt-get -y install nano

# add storage config
# ADD db.conf /usr/src/app/conf/storage/db.conf

# add webserver config
# ADD webserver.conf /usr/src/app/conf/net/api/webserver.conf

# Add analysis pipeline cronjob
# ADD dk_run_cronjob.sh /usr/src/app/dk_run_cronjob.sh
# RUN chmod u+x /usr/src/app/dk_run_cronjob.sh
# ADD crontab /etc/cron.d/pipeline-cron
# RUN chmod 0644 /etc/cron.d/pipeline-cron
# RUN mkdir /var/log/emission

# start the server and run cron
ADD dk_run_app.sh /usr/src/app/dk_run_app.sh
RUN chmod u+x /usr/src/app/dk_run_app.sh

EXPOSE 8080

CMD ["/bin/bash", "/usr/src/app/dk_run_app.sh"]
