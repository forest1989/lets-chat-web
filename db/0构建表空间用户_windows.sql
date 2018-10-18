--1 D:\oracle\Administrator\oradata\orcl
--该脚本需在数据库管理员权限的用户下操作
--删除用户，及级联关系也删除掉
drop user letschat cascade;
--删除表空间，及对应的表空间文件也删除掉
drop tablespace WEBTEMP including contents and datafiles cascade constraint;
drop tablespace WEBDATA including contents and datafiles cascade constraint;

--1、创建临时表空间
create temporary tablespace WEBTEMP  
tempfile 'C:\app\Administrator\oradata\orcl\WEBTEMP.DBF' 
size 50m  
autoextend on  next 50m maxsize 20480m  
extent management local; 
--2、创建表空间脚本
create tablespace WEBDATA  
logging  
datafile 'C:\app\Administrator\oradata\orcl\WEBDATA.DBF' 
size 50m  
autoextend on  
next 50m maxsize 20480m  
extent management local;

--3、创建用户脚本
create user letschat identified by letschat
default tablespace WEBDATA  
temporary tablespace WEBTEMP;

--4、给用户授予权限
grant connect,resource,dba to letschat;





