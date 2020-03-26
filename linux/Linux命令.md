# 1.软件安装卸载

## 1.1 rpm

```shell
#查询到当前系统中安装的所有的软件包
rpm -qa
#查询pcre安装的软件包名称
rpm -qa | grep "pcre"
#查询rpm包安装到哪里
rpm -ql pcre-7.8-7.el6.x86_64
```

## 1.2 yum

```shell
yum -y install lrzsz
```



## 1.3 wget

# 2. 防火墙

1. 查看状态

   ```shell
   #
   systemctl status firewalld
   #
   servcie firewalld status
   #
   firewall-cmd --state
   ```

2. 启停

   ```shell
   #
   systemctl status/start/stop/restart firewalld
   #
   servcie firewalld status/start/stop/restart
   ```

3. 开机自启

   ```shell
   #开机启动
   systemctl enable firewalld
   #禁用开机启动
   systemctl disabled firewalld
   ```

4. 端口管理

   - 查看系统打开端口列表

     ```shell
     firewall-cmd --zone=public --list-port
     ```
     
   - 开放端口

     ```shell
     firewall-cmd --zone=public --add-port=8080/tcp --permanent
     ```

   - 重新载入一下防火墙设置，使设置生效

     ```shell
     firewall-cmd --reload
     ```

     

5. 服务管理

   - 查看当前开了哪些服务

     ```shell
     #这里的每一个服务名对应对应/usr/lib/firewalld/services下面一个xml文件
     #文件有描述该服务用了什么协议，对应的端口号，这些端口即为外界可以访问的端口
     firewall-cmd --list-services
     ```

   - 查看还有哪些服务可以打开

     ```shell
     firewall-cmd --get-services
     ```

     
