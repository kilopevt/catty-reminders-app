#!/bin/bash
cd /home/hesa/catty-reminders-app || exit 1

SHA=$1
echo "Deploying SHA: $SHA"

git fetch --all
git reset --hard "$SHA"

# Записываем хэш
echo "DEPLOY_REF=$SHA" | sudo tee /etc/catty-app-env

# Перезапускаем сервис
sudo /usr/bin/systemctl restart catty

sleep 3
if systemctl is-active --quiet catty; then
    echo "SUCCESS: Deployed $SHA"
else
    echo "ERROR: App failed"
    exit 1
fi
