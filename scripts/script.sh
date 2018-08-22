#!/bin/bash

# Setando variáveis de ambiente
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe;
export LD_LIBRARY=/u01/app/oracle/product/11.2.0/xe/lib/;
export ORACLE_SID=XE;
export PATH=$ORACLE_HOME/bin:$PATH;
export NLS_LANG='BRAZILIAN PORTUGUESE_BRAZIL.WE8ISO8859P1'

# Configurações de proxy
unset http_proxy;
unset no_proxy;

# Nome do Banco de Dados
DB_NAME="banco_de_teste"

# Usuario do Banco de Dados
DB_USER="root"

# Senha do Banco de Dados
DB_PASS="root"

# Iniciando serviço do oracle
service oracle-xe start

if [ ! -f "/u01/app/oracle/datafile/"$DB_NAME".dbf" ]; then
    # Criação da Tablespace / usuário e permissões
    echo "create tablespace" $DB_NAME "datafile '/u01/app/oracle/datafile/"$DB_NAME".dbf' size 32m autoextend on next 32m maxsize 2048m extent management local;" | sqlplus -s SYSTEM/oracle &&
    echo "CREATE USER" $DB_USER "IDENTIFIED BY" $DB_PASS "DEFAULT TABLESPACE "$DB_NAME" TEMPORARY TABLESPACE "TEMP";" | sqlplus -s SYSTEM/oracle &&
    echo "ALTER USER" $DB_USER "QUOTA UNLIMITED ON " $DB_NAME";" | sqlplus -s SYSTEM/oracle &&
    echo "GRANT create procedure, create session, create table,create type, create view, create synonym, create trigger, resource TO " $DB_USER";" | sqlplus -s SYSTEM/oracle
fi
echo "Oracle rodando! :)"

