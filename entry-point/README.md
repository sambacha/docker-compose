# CMD ["entry-point.sh"]

## CMD and ENTRYPOINT Interactions

Both CMD and ENTRYPOINT instructions define what command gets executed when running a container. 

There are few rules that describe their co-operation.

  - Dockerfile should specify at least one of CMD or ENTRYPOINT commands.

  - ENTRYPOINT should be defined when using the container as an executable.

  - CMD should be used as a way of defining default arguments for an ENTRYPOINT command or for executing an ad-hoc command in a container.

  - CMD will be overridden when running the container with alternative arguments.

## ENTRYPOINT / CMD Cominbations 

> The table below shows what command is executed for different ENTRYPOINT / CMD combinations:


| ****                           | **No ENTRYPOINT**             | **ENTRYPOINT exec_entry p1_entry** | **ENTRYPOINT [“exec_entry”, “p1_entry”]**           |
|--------------------------------|-------------------------------|------------------------------------|-----------------------------------------------------|
| No CMD                         | error, not allowed            | /bin/sh \-c exec\_entry p1\_entry  | exec\_entry p1\_entry                               |
| CMD \[“exec\_cmd”, “p1\_cmd”\] | exec\_cmd p1\_cmd             | /bin/sh \-c exec\_entry p1\_entry  | exec\_entry p1\_entry exec\_cmd p1\_cmd             |
| CMD \[“p1\_cmd”, “p2\_cmd”\]   | p1\_cmd p2\_cmd               | /bin/sh \-c exec\_entry p1\_entry  | exec\_entry p1\_entry p1\_cmd p2\_cmd               |
| CMD exec\_cmd p1\_cmd          | /bin/sh \-c exec\_cmd p1\_cmd | /bin/sh \-c exec\_entry p1\_entry  | exec\_entry p1\_entry /bin/sh \-c exec\_cmd p1\_cmd |



### References 

[docker documentation, entrypoint](https://docs.docker.com/engine/reference/builder/#entrypoint)
