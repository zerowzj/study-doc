# 	1. 安装

## 1.1 WAR

## 1.2 RPM

### 1.2.1 安装

1. 执行

   ```shell
   rpm -ivh jenkins-2.204.4-1.1.noarch.rpm
   ```

2. 编辑/etc/init.d/jenkins，添加java命令

   ```shell
   /usr/local/jdk1.8.0_162/bin/java
   ```

3. 启停

   ```shell
   service jenkins status/start/stop/restart
   ```

### 1.2.2 目录

- /etc/sysconfig/jenkins（ 配置文件）

  可配置JENKINS_HOME、JENKINS_JAVA_OPTIONS、JENKINS_PORT等端口

- /var/lib/jenkins/（默认的JENKINS_HOME目录，主目录）

  1. workspace
  2. jobs
  3. 

- /var/log/jenkins/jenkins.log（日志文件）

- /usr/lib/jenkins/jenkins.war（war包 ）

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

2. Git插件

3. 构建参数

   - Git插件

   - Git Parameter

     这是一个参数构建扩展，可以在构建的时候选择git的某一个分支来构建服务。在参数化构建步骤当中，可添加Git的branch或者tag来作为参数进行构建

   - Build with Parameters

4. Git Publisher

5. 时间戳插件

   - Zentimestamp

     系统管理 --> 系统设置 --> 全局属性设置日期和时间格式，变量名问BUILD_TIMESTAMP。

6. 超时插件

7. workspace cleanup

   每次build之前删除workspace目录下指定的文件

# 3. 使用

## 3.1 任务

1. General
   - 12321