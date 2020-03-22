# 	1. 安装

## 1.1 WAR



## 1.2 RPM

### 1.2.1 安装

1. 执行

   ```shell
   rpm -ivh jenkins-2.204.4-1.1.noarch.rpm
   ```

2. 编辑/etc/init.d/jenkins，添加JDK路径

3. 启停

   ```shell
   servcie jenkins start/stop/restart
   ```

### 1.2.2 目录

- /usr/lib/jenkins/jenkins.war（war包 ）
- /etc/sysconfig/jenkins（ 配置文件）
- /var/lib/jenkins/（默认的JENKINS_HOME目录，主目录）
- /var/log/jenkins/jenkins.log（日志文件）
- /etc/init``.d``/jenkins（启动文件）

# 2. 配置

## 2.1 系统设置

## 2.2 全局安全设置

## 2.3 凭据配置

## 2.4 全局工具配置

1. JDK配置
2. Maven配置
3. Git配置

## 2.5 插件管理

1. 中文插件
2. git插件
3. git参数化插件
4. 时间戳插件
5. 超时插件

# 3. 使用

## 3.1 任务

1. General
   - 12321