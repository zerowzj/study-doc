#!/bin/sh
# chkconfig: 2345 90 10
# description: Nginx server

NGINX_DIR=/server/nginx
EXEC=$NGINX_DIR/sbin/nginx

PID=$(ps -ef |grep $JEKINS_WAR |grep -v grep |awk '{print $2}')

case "$1" in
    start)
      if [ -z "$PID" ]
      then
          echo "Starting Jenkins..."
          $EXEC
      else
          echo "$PID exists, process is already running or crashed"
      fi
    ;;
    stop)
      if [ -n "$PID" ]
      then
          echo "Stop Jenkins..."
          $EXEC -s stop
      fi
      echo "Jenkins stopped"
    ;;
    reload)
      if
esac