# 	1. 安装及卸载

## 1.1 安装

1. 解压压缩包到目录/usr/server/nexus2

   ```shell
   tar -zxvf nexus-2.14.16-01-bundle.tar.gz -C /usr/server/nexus2 
   ```


## 1.2 启停

​		默认情况下，不建议以root用户运行Nexus，可以修改bin/nexus中的配置跳过警告（修改RUN_AS_USER=root）；可以使用系统已有用户启停；也可以创建新用户启动，添加用户如下。

```shell
#添加用户
useradd nexus
#赋权
chown -R nexus:nexus /usr/server/nexus2

#切换用户
su nexus
```

### 1.2.1 脚本启动

1. 进入/nexus-2.14.16-01/bin目录，使用以下命令启停

   ```shell
   #
   ./nexus start/run
   #
   ./nexus stop
   #
   ./nexus status
   #
   ./nexus restart
   #
   ./nexus start/stop/run/run-redirect/status/restart/force-reload
   ```

2. 访问url，默认用户和密码admin/admin123

   - http://<IP>:8081/nexus（2.x）
   - http://<IP>:8081 （3.x）

### 1.2.2 服务启动（systemctl）

1. 在目录/lib/systemd/system下创建文件nexus.service

   ```shell
   [Unit]
   Description=nexus
   After=network.target
   
   [Service]
   Type=forking
   Environment=RUN_AS_USER=root
   ExecStart=/usr/server/nexus2/nexus-2.14.16-01/bin/nexus start
   ExecReload=/usr/server/nexus2/nexus-2.14.16-01/bin/nexus stop
   ExecStop=/usr/server/nexus2/nexus-2.14.16-01/bin/nexus stop
   PrivateTmp=true
   
   [Install]
   WantedBy=multi-user.target
   ```

2. 重新加载

   ```shell
   systemctl daemon-reload
   ```

3. 启停服务

   ```shell
   #启动服务
   systemctl start nexus
   #启动服务
   systemctl stop nexus
   #启动服务
   systemctl start nexus
   ```

4. 设置开机启动

   ```shell
   #开机启动
   systemctl enable nexus.service
   ```

### 1.2.3 服务启动（service）

1. 进入目录/etc/init.d或/etc/rc.d/init.d，新建nexus脚本

   ```shell
   #!/bin/sh
   #chkconfig:2345 20 90
   #description:nexus
   #processname:nexus
   
   NEXUS_HOME=/usr/server/nexus2/nexus-2.14.16-01
   case $1 in
   start)
     sudo $NEXUS_HOME/bin/nexus start
     ;;
   stop)
     sudo $NEXUS_HOME/bin/nexus stop
     ;;
   status)
     sudo $NEXUS_HOME/bin/nexus status
     ;;
   restart)
     sudo $NEXUS_HOME/bin/nexus restart
     ;;
   *)
     echo "Usage: nexus {start|stop|status|restart}"
     ;;
   esac
   ```

2. 设置脚本权限

   ```
   chmod a+x /etc/init.d/nexus
   ```

3. 服务启停

   ```shell
   #
   service nexus start
   #
   service nexus stop
   ```

4. 设置开机启动

   ```
   sudo chckconfig --add nexus
   ```

   

### 1.2.4 启动日志

1. nexus-2.14.16-01/logs/wrapper.log

## 1.3 卸载

1. 停止服务，直接删除目录/usr/server/nexus2 



# 2. 服务器配置

1. 启动脚本：nexus-2.14.16-01/bin/nexus

   ```shell
   #主目录
   NEXUS_HOME=".."
   #运行用户
   RUN_AS_USER=root
   
   #
   APP_NAME="nexus"
   APP_LONG_NAME="Nexus OSS"
   ```

2. 配置文件：nexus-2.14.16-01/conf/nexus.properties

   ```shell
   #端口
   application-port=8081
   #
   application-host=0.0.0.0
   #
   nexus-webapp=${bundleBasedir}/nexus
   nexus-webapp-context-path=/nexus
   ```

3. nexus-2.14.16-01/bin/jsw/conf/wrapper.conf

# 3. pom.xml配置

## 3.1 部署构件

1. 发布

   ```xml
   <distributionManagement>
       <repository>
           <id>releases</id><!--这个ID需要与你的release仓库的Repository ID一致-->
           <url>http://192.168.1.11:8081/nexus/content/repositories/releases</url>
       </repository>
       <snapshotRepository>
           <id>snapshots</id><!--这个ID需要与你的snapshots仓库的Repository ID一致-->
           <url>http://192.168.1.11:8081/nexus/content/repositories/snapshots</url>
       </snapshotRepository>
   </distributionManagement>
   ```

2. 修改本地$MAVEN_HOME/conf目录下的settings.xml配置文件，添加如下配置

   ```xml
   <servers>
       <server>
           <id>releases</id>
           <username>admin</username>
           <password>admin123</password>
       </server>
       <server>
           <id>snapshots</id>
           <username>admin</username>
           <password>admin123</password>
       </server>
   </servers>
   ```

## 3.2 下载构件

1. 当前

   - 构件仓库

     ```xml
     <!--指定Nexus的构件仓库-->
     <repositories>
         <repository>
             <id>public</id>
             <name>Team Maven Repository</name>
             <url>http://192.168.1.11:8081/nexus/content/groups/public/</url>
             <releases>
                 <enabled>true</enabled>
             </releases>
             <snapshots>
                 <enabled>true</enabled>
             </snapshots>
         </repository>
     </repositories>
     ```

   - 插件仓库

     ```xml
     <pluginRepositories>
         <pluginRepository>
             <id>public</id>
             <name>Team Maven Repository</name>
             <url>http://192.168.1.11:8081/nexus/content/groups/public/</url>
             <releases>
                 <enabled>true</enabled>
             </releases>
             <snapshots>
                 <enabled>true</enabled>
             </snapshots>
         </pluginRepository>
     </pluginRepositories>
     ```

2. 在settings.xml中配置properties元素，这样就能让本机所有的Maven项目都使用Maven私服

   ```xml
   <properties>
           <repository>
               <id>public</id>
               <name>Team Maven Repository</name>
               <url>http://192.168.1.11:8081/nexus/content/groups/public/</url>
               <releases>
                   <enabled>true</enabled>
               </releases>
               <layout>default</layout>
               <snapshots>
                   <enabled>true</enabled>
               </snapshots>
           </repository>
   </properties>
   ```

吗

# 4. 仓库类型











