#!/bin/sh
# chkconfig: 2345 90 10
# description: Zookeeper server

ZK_DIR=/server/zk/zk_2181
EXEC=$ZK_DIR/bin/zkServer.sh

PID=$(ps -ef |grep $ZK_DIR |grep -v grep |awk '{print $2}')

case "$1" in
    start)
      if [ -z "$PID" ]
      then
          echo "Starting zookeeper..."
          $EXEC start
      else
          echo "$PID exists, process is already running or crashed"
      fi
    ;;
    stop)
      if [ -n "$PID" ]
      then
          echo "Stop zookeeper..."
          $EXEC stop
      fi
      echo "Zookeeper stopped"
    ;;
esac