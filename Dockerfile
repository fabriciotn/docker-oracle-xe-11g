FROM wnameless/oracle-xe-11g

LABEL mantainer="Fabricio Teixeira Nascimento <fabriciotn82@gmail.com>"

# Copiando arquivos de configuração
COPY /admin/*.* /u01/app/oracle/product/11.2.0/xe/network/admin/

# Cria diretório de scripts, e diretório para os dados
RUN mkdir /u01/app/oracle/scripts && \
    mkdir /u01/app/oracle/datafile && \
    chown oracle /u01/app/oracle && su - oracle

# Configuaração de proxy, caso seja necessário
# ENV HTTP_PROXY "http://you_server_proxy:port"
# ENV HTTPS_PROXY "https://you_server_proxy:port"

ENV ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
ENV PATH=$PATH:/u01/app/oracle/product/11.2.0/xe/bin
ENV ORACLE_SID=/u01/app/oracle/product/11.2.0/xe/lib/
ENV LD_LIBRARY=XE;

WORKDIR /u01/app/oracle

CMD [ "sh", "-c", "chmod -R 777 /u01/app/oracle/scripts/script.sh && ./scripts/script.sh && /bin/bash"]