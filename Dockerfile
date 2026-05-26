FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

RUN mkdir -p /var/opt/mssql \
    && mkdir -p /var/opt/mssql/data \
    && mkdir -p /var/opt/mssql/log \
    && mkdir -p /var/opt/mssql/backup \
    && mkdir -p /var/opt/mssql/.system \
    && mkdir -p /.system \
    && chmod -R 777 /var/opt/mssql \
    && chmod -R 777 /.system

ENV ACCEPT_EULA=Y
ENV MSSQL_PID=Developer
ENV MSSQL_MEMORY_LIMIT_MB=512
ENV HOME=/var/opt/mssql
ENV MSSQL_DATA_DIR=/var/opt/mssql/data
ENV MSSQL_LOG_DIR=/var/opt/mssql/log
ENV MSSQL_BACKUP_DIR=/var/opt/mssql/backup

WORKDIR /var/opt/mssql

CMD ["/opt/mssql/bin/sqlservr"]