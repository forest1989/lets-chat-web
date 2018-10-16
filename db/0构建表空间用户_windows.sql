--1 D:\oracle\Administrator\oradata\orcl
--该脚本需在数据库管理员权限的用户下操作
--1、创建临时表空间
create temporary tablespace WEBTEMP  
tempfile 'D:\app\mahe\oradata\orcl\WEBTEMP.DBF' 
size 50m  
autoextend on  next 50m maxsize 20480m  
extent management local; 
--2、创建表空间脚本
create tablespace WEBDATA  
logging  
datafile 'D:\app\mahe\oradata\orcl\WEBDATA.DBF' 
size 50m  
autoextend on  
next 50m maxsize 20480m  
extent management local;

--3、创建用户脚本
create user jeesite identified by jeesite
default tablespace WEBDATA  
temporary tablespace WEBTEMP;

--4、给用户授予权限
grant connect,resource,dba to jeesite;





