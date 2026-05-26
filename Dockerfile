FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

RUN mkdir -p /var/opt/mssql \
    && mkdir -p /var/opt/mssql/data \
    && mkdir -p /var/opt/mssql/log \
    && mkdir -p /var/opt/mssql/backup \
    && mkdir -p /var/opt/mssql/.system \
    && chmod -R 777 /var/opt/mssql

ENV HOME=/var/opt/mssql
ENV ACCEPT_EULA=Y
ENV MSSQL_PID=Developer

WORKDIR /var/opt/mssql

CMD ["/opt/mssql/bin/sqlservr"]