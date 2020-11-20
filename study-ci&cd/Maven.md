阿萨德



# 1. 版本号管理

​		maven 的依赖管理是基于版本管理的，对于发布状态的 artifact，如果版本号相同，即使内部的镜像服务器上的组件比本地新，maven也不会主动下载。若开发阶段都是基于正式发布版本来做依赖管理，那此时，就需要升级组件的版本号，可这操作明显过于繁复了。

​		若基于快照版本，问题就迎刃而解了，maven已准备好了这一切：maven 中的仓库分为两种：snapshot 快照仓库和 release 发布仓库。snapshot 快照仓库用于保存开发过程中的不稳定版本，release正式仓库则是用来保存稳定的发行版本。定义一个组件/模块为快照版本，只需要在 pom 文件中在该模块的版本号后加上 -SNAPSHOT 即可（注意这里必须是大写）。

​		maven 会根据模块的版本号（pom文件中的version）中是否带有 -SNAPSHOT 来判断是快照版本还是正式版本。若是快照版本，在 mvn deploy 时会自动发布到快照版本库中。使用快照版本的模块，在不更改版本号的情况下，直接编译打包时，maven 会自动从镜像服务器上下载最新的快照版本。

​		若是正式发布版本，在 mvn deploy 时会自动发布到正式版本库中，而此类模块，在不更改版本号的情况下，编译打包时如果本地已经存在该版本的模块则不会主动去镜像服务器上下载 。

​		故 开发阶段，可将公用库的版本设置为快照版本，被依赖组件则引用快照版本进行开发，在公用库的快照版本更新后，也无需修改 pom 文件（修改版本号来下载新的版本），直接 mvn 执行相关编译、打包命令即可重新下载最新的快照库了。

# 2. settings.xml配置

## 1.2  localRepository

​		该值表示构建系统本地仓库的路径。其默认值：~/.m2/repository

```xml
<localRepository>${user.home}/.m2/repository</localRepository>
```

## 1.3 interactiveMode

​		表示maven是否需要和用户交互以获得输入。如果maven需要和用户交互以获得输入，则设置成true，反之则应为false。默认为true。

```xml
<interactiveMode>true</interactiveMode>
```

## 1.4 usePluginRegistry





## 1.5 offline





## 1.6 pluginGroups





## 1.7 servers

​		一般，仓库的下载和部署是在pom.xml文件中的repositories和distributionManagement元素中定义的。然而，一般类似用户名、密码（**有些仓库访问是需要安全认证的**）等信息不应该在pom.xml文件中配置，这些信息可以配置在settings.xml中

```xml
<servers>
    <!--服务器元素包含配置服务器时需要的信息 -->
    <server>
      <!--这是server的id（注意不是用户登陆的id），该id与distributionManagement中repository元素的id相匹配。 -->
      <id>server001</id>
      <!--鉴权用户名。鉴权用户名和鉴权密码表示服务器认证所需要的登录名和密码。 -->
      <username>my_login</username>
      <!--鉴权密码 。鉴权用户名和鉴权密码表示服务器认证所需要的登录名和密码。密码加密功能已被添加到2.1.0 +。详情请访问密码加密页面 -->
      <password>my_password</password>
      <!--鉴权时使用的私钥位置。和前两个元素类似，私钥位置和私钥密码指定了一个私钥的路径（默认是${user.home}/.ssh/id_dsa）以及如果需要的话，一个密语。将来passphrase和password元素可能会被提取到外部，但目前它们必须在settings.xml文件以纯文本的形式声明。 -->
      <privateKey>${usr.home}/.ssh/id_dsa</privateKey>
      <!--鉴权时使用的私钥密码。 -->
      <passphrase>some_passphrase</passphrase>
      <!--文件被创建时的权限。如果在部署的时候会创建一个仓库文件或者目录，这时候就可以使用权限（permission）。这两个元素合法的值是一个三位数字，其对应了unix文件系统的权限，如664，或者775。 -->
      <filePermissions>664</filePermissions>
      <!--目录被创建时的权限。 -->
      <directoryPermissions>775</directoryPermissions>
    </server>
  </servers>
```

## 1.8 mirrors

​		为仓库列表配置的下载镜像列表

```xml
<mirrors>
    <!-- 给定仓库的下载镜像。 -->
    <mirror>
      <!-- 该镜像的唯一标识符。id用来区分不同的mirror元素。 -->
      <id>planetmirror.com</id>
      <!-- 镜像名称 -->
      <name>PlanetMirror Australia</name>
      <!-- 该镜像的URL。构建系统会优先考虑使用该URL，而非使用默认的服务器URL。 -->
      <url>http://downloads.planetmirror.com/pub/maven2</url>
      <!-- 被镜像的服务器的id。例如，如果我们要设置了一个Maven中央仓库（http://repo.maven.apache.org/maven2/）的镜像，就需要将该元素设置成central。这必须和中央仓库的id central完全一致。 -->
      <mirrorOf>central</mirrorOf>
    </mirror>
  </mirrors>
```

## 1.9 proxies

## 1.10 profiles

## 1.11 activeProfiles

## 1.12 properties

## 1.13 repositories

## 1.14 pluginRepositories



# 1.  命令参数

| 命令参数      | 备注                                                         |
| ------------- | ------------------------------------------------------------ |
| mvn -Pxxx     | 激活 id 为 xxx的profile（如有多个，用逗号隔开）              |
| mvn -Dxxx=yyy | 指定Java全局属性                                             |
|               |                                                              |
| mvn -U        | 强制更新snapshot类型的插件或依赖库（否则maven一天只会更新一次snapshot依赖） |
| mvn -f        | --file <file> 强制使用备用的POM文件                          |
| mvn -pl       | --module_name 在指定模块上执行命令                           |
|               |                                                              |
| mvn -X        | --debug 控制Maven的日志级别,产生执行调试信息                 |
|               |                                                              |



