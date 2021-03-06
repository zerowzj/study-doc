# 一. 软件包安装卸载

## 1.1 rpm

​		rpm（redhat package manager）原本是 Red Hat Linux 发行版专门用来管理 Linux 各项套件的程序。类似Windows里面的“添加/删除程序”

| 选项 | 含义                                                |      |
| ---- | --------------------------------------------------- | ---- |
| -a   | 查询所有套件                                        |      |
| -q   | 使用询问模式，当遇到任何问题时，rpm指定会先询问用户 |      |
|      |                                                     |      |
|      |                                                     |      |
|      |                                                     |      |
|      |                                                     |      |
|      |                                                     |      |
|      |                                                     |      |
|      |                                                     |      |



```shell
#查询到当前系统中安装的所有的软件包
rpm -qa
#查询pcre安装的软件包名称
rpm -qa | grep "pcre"
#查询rpm包安装到哪里
rpm -ql pcre-7.8-7.el6.x86_64
```

## 1.2 yum

​		yum（ Yellow dog Updater, Modified）是一个在Fedora和RedHat以及SUSE中的Shell前端软件包管理器。基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软体包，无须繁琐地一次次下载、安装。

​		yum提供了查找、安装、删除某一个、一组甚至全部软件包的命令，而且命令简洁而又好记。

​		yum的配置文件在 /etc/yum.conf 

1. 语法

   ```shell
   yum [options] [command] [package ...]
   ```

   



## 1.3 源码

# 二. 防火墙

## 2.1 Centos6



## 2.2 Centos7

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
   #方式一
   systemctl status/start/stop/restart firewalld
   #方式二
   servcie firewalld status/start/stop/restart
   ```

3. 开机自启

   ```shell
   #启用开机启动
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


# 三. 用户和组

## 3.1 用户

1. 新增用户

   ```shell
   
   ```

2. 新增用户

   ```shell
   useradd USERNAME
   ```

3. 123

4. 123

5. 1321

6. 23123

7. 123

8. 123

9. 1231

10. 23

## 3.2 组

1. 查询当前用户组

   ```shell
   groups
   ```

2. 12312



# 四. 服务创建和注册

## 4.1 Centos6

​		此方法主要是Centos6 之前的系统服务注册方式，目前依然被Centos7兼容。

### 4.1.1 创建服务文件

​		在/etc/rc.d/init.d目录下创建ruoli_service服务文件

```shell
#



```

### 4.1.2 授予执行权限

```shell
#
chmod +x my_service
```



### 4.1.3 操作服务

```shell
#
service my_service start
#
service my_service stop
#
service my_service restart
#
service my_service status
```



## 4.2 Centos7

### 4.2.1 创建服务文件



### 4.2.2 操作服务



## 5.3 开机启动



# 9 安全防护

## 9.1 禁止root远程登录

​		Linux中root用户是超级管理员，可以针对root用户暴力破解密码，这样很不安全，工作中我们一般禁止root用户直接远程登陆，开设一个或多个普通用户，只允许登陆普通用户，如果有需要用root用户，可以su切换root 或者sudo来拥有root权限执行命令

1. 编辑/etc/ssh/sshd_config，修改以下内容

   ```shell
   #
   PermitRootLogin no
   ```

2. 重启sshd

   ```shell
   #
   systemctl restart sshd
   ```

## 9.2 普通用户分配root权限

1. 创建用户

   ```shell
   #创建用户
   
   #添加密码
   
   #分配组
   ```

2. 分配root权限

   ```
   
   ```

   

3. 免密码，编辑/etc/sudoers

   

