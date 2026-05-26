FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

RUN mkdir -p /var/opt/mssql \
    && mkdir -p /var/opt/mssql/data \
    && mkdir -p /var/opt/mssql/log \
    && mkdir -p /var/opt/mssql/backup \
    && mkdir -p /var/opt/mssql/.system \
    && chown -R mssql:root /var/opt/mssql \
    && chmod -R 775 /var/opt/mssql

USER mssql

WORKDIR /var/opt/mssql

CMD ["/opt/mssql/bin/sqlservr"]
