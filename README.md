# docker-oracle-xe-11g

## INICIO
- O Docker deve estar instalado e funcionando.
- Dentro das configurações do Docker, é necessário compartilhar o driver em que a pasta Oracle11g estiver para que o Docker consiga acessar o diretório e montar o volume.
- Utilizar um bash de sua preferência.
- Abrir o bash de dentro da pasta Oracle11g.
- Build da imagem 

  ```docker build -t oracle-xe:11g .```

- Gerar seu container a partir da imagem carregada

  ```docker run -idt -p 1521:1521 -h myoracle --name oracle -v /$(pwd)/scripts:/u01/app/oracle/scripts -v /$(pwd)/datafile:/u01/app/oracle/datafile oracle-xe:11g```

- Configurar o sqldeveloper para acessar o banco:
```
    Banco banco_de_teste:
        Nome do usuário: root
        Sennha: root
        Nome do Host: localhost
        Porta: 1521
        SID: XE
```
