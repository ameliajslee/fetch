FROM mysql:5.6

ADD ./fetch.sql /docker-entrypoint-initdb.d

ENV MYSQL_DATABASE=fetch
	MYSQL_ROOT_PASSWORD=test

EXPOSE 3306