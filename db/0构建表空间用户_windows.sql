--1 D:\oracle\Administrator\oradata\orcl
--1
--创建表空间脚本
create tablespace WEBDATA  
logging  
datafile 'D:\app\mahe\oradata\orcl\WEBDATA.DBF' 
size 50m  
autoextend on  
next 50m maxsize 20480m  
extent management local;

--创建用户脚本
create user jeesite identified by jeesite
default tablespace WEBDATA  
temporary tablespace TEMP;
grant connect,resource,dba to jeesite;




