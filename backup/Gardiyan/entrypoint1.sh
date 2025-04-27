#!/bin/ash

if [ -f "/tmp/deploy_done" ]; then
    echo "compose ayağa kalkınca çalıştırıcak restart olunca çalıştırmıcak."
    exit 0
fi

sleep 130

echo "netdisco-deploy başlatılıyor..."

expect << EOF
spawn netdisco-deploy
expect "Continue? (yes/no)" 
send "yes\r"
expect "Continue? (yes/no)" 
send "yes\r"
expect "DB user (default netdisco):"
send "admin\r"
expect "DB password:"
send "1\r"
expect "Update MAC prefixes (OUI data)? (yes/no)"
send "yes\r"
expect "Update MIB files? (yes/no)"
send "yes\r"
expect eof
EOF

touch /tmp/deploy_done
echo "netdisco-deploy tamamlandı ve tekrar çalıştırılmayacak."



