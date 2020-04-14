#!/bin/sh
# chkconfig: 2345 90 10
# description: Jenkins server

JENKINS_PORT=8080
JENKINS_DIR=/server/jenkins

JENKINS_WAR=$JENKINS_DIR/jenkins.war
LOG_FILE=$JENKINS_DIR/logs/jenkins.log
PID_FILE=/var/run/jenkins.pid

# jenkins工作目录，默认位于 /root/.jenkins
export JENKINS_HOME=$JENKINS_DIR/home
# /etc/init.d
export JAVA_HOME=/usr/local/jdk1.8.0_162
export PATH=$JAVA_HOME/bin:$PATH

PID=$(ps -ef |grep $JENKINS_WAR |grep -v grep |awk '{print $2}')

case "$1" in
    start)
      if [ -z "$PID" ]
      then
          echo "Starting Jenkins..."
          nohup java -jar $JENKINS_WAR --httpPort=$JENKINS_PORT > $LOG_FILE 2>&1 &
      else
          echo "$PID exists, process is already running or crashed"
      fi
    ;;
    stop)
      if [ -n "$PID" ]
      then
          echo "Stop Jenkins..."
          kill -9 $PID
      fi
      echo "Jenkins stopped"
    ;;
    *)
      echo "Usage: $0 {start|stop}"
esac