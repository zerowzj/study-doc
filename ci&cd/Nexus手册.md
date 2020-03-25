# 	1. 安装

1. 解压到指定目录/usr/server/nexus3

   ```shell
   tar -zxvf nexus-3.12.1-01-unix.tar.gz -C /usr/server/nexus3  
   ```

2. 配置用户

   ```shell
   #添加用户
   useradd nexus
   #赋权
   chown -R nexus:nexus /usr/server/nexus3
   
   #切换用户
   su nexus
   ```

3. 启动，执行/nexus-3.12.1-01/bin命令

   ```shell
   ./nexus start/stop/run/run-redirect/status/restart/force-reload
   ```

4. 访问http://<IP>:8081，默认用户和密码admin/admin123

# 2. 配置

1. nexus-3.12.1-01/etc/nexus-default.properties

# 3. 仓库类型











