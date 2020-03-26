# 	1. 安装及卸载

## 1.1 安装

1. 解压到指定目录/usr/server/nexus3

   ```shell
   tar -zxvf nexus-2.14.16-01-bundle.tar.gz -C /usr/server/nexus2 
   ```

2. 配置用户

   ```shell
   #添加用户
   useradd nexus
   #赋权
   chown -R nexus:nexus /usr/server/nexus2
   
   #切换用户
   su nexus
   ```

3. 启动，执行/nexus-2.14.16-01/bin命令

   ```shell
   ./nexus start/stop/run/run-redirect/status/restart/force-reload
   ```

4. 访问url，默认用户和密码admin/admin123

   - http://<IP>:8081/nexus（2.x）
   - http://<IP>:8081 （3.x）

## 1.2 卸载

1. 停止服务，直接删除nexus2目录

# 2. 配置

1. nexus-3.12.1-01/etc/nexus-default.properties

# 3. 仓库类型











