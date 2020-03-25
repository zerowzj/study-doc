# 1. 防火墙

1. 查看状态

   ```shell
   #
   systemctl status firewalld
   #
   servcie firewalld status
   #
   firewalld-cmd --state
   ```

   

2. 启停及查看状态

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

4. 查看系统打开端口列表

   ```shell
   firewall-cmd --zone=public --list-port
   ```

5. 