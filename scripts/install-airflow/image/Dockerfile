FROM apache/airflow:2.3.2

USER root
RUN sudo curl -o /etc/apt/trusted.gpg.d/mariadb_release_signing_key.asc 'https://mariadb.org/mariadb_release_signing_key.asc'
RUN sudo sh -c "echo 'deb https://tw1.mirror.blendbyte.net/mariadb/repo/10.8/debian bullseye main' >>/etc/apt/sources.list"
RUN apt-get update 
RUN apt-get install -y libmariadbclient-dev
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y krb5-user libkrb5-dev libpam-krb5
RUN apt-get install -y build-essential gcc libsasl2-dev

ENV PATH=/usr/lib/gcc/x86_64-linux-gnu/10/:$PATH

USER airflow
ADD requirements.txt /tmp/
RUN pip3 --timeout=600 install -r /tmp/requirements.txt
