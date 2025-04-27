#!/bin/bash

while inotifywait -r -e create,modify,move /home/gardiyan/Repo; do
  sudo find /home/gardiyan/Repo -type f -exec chown root:root {} \; -exec chmod 777 {} \;
  sudo find /home/gardiyan/Repo -type d -exec chown root:root {} \; -exec chmod 777 {} \;
done &

 Guacamole uygulamasını başlat
exec /opt/guacamole/bin/start.sh
