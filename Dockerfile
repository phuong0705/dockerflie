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
ENV MSSQL_MEMORY_LIMIT_MB=512
ENV MSSQL_DATA_DIR=/var/opt/mssql/data
ENV MSSQL_LOG_DIR=/var/opt/mssql/log
ENV MSSQL_BACKUP_DIR=/var/opt/mssql/backup

WORKDIR /var/opt/mssql

CMD ["/bin/bash", "-lc", "cd /var/opt/mssql && exec /opt/mssql/bin/sqlservr"]