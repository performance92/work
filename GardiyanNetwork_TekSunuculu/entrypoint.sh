#!/bin/ash

if [ -f "/tmp/deploy_done" ]; then
  echo "Deploy zaten yapılmış. Netdisco başlatılıyor..."
else
  echo "Netdisco Deploy Başlatılıyor..."

  sleep 120

  expect -c '
  set timeout 20
  spawn netdisco-deploy

  expect "Continue? \\\[yes/no\\\]" 
  send "yes\r"

  expect "Continue? \\\[yes/no\\\]" 
  send "yes\r"

  expect "DB user \\\[default netdisco\\\]:" 
  send "admin\r"

  expect "DB password:" 
  send "1\r"

  expect "Update MAC prefixes (OUI data)? \\\[yes/no\\\]" 
  send "yes\r"

  expect "Download and update MIB files? \\\[y/N\\\]" 
  send "y\r"

  expect eof
  '

  if [ $? -eq 0 ]; then
    echo "Deploy Başarılı!"
    touch /tmp/deploy_done
  else
    echo "HATA: Deploy işlemi başarısız oldu!" >&2
    exit 1
  fi

fi
echo "netdisco-web-aktif-edildi."
while true; do
  sleep 3600  # 1 saatte bir uyan ve kontrol et
done

