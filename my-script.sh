#!/bin/zsh

scp .bin/cabrito-server-linux-intel tost@192.168.2.28:~/cabrito/cabrito-server-linux-intel
scp -r backend/.data tost@192.168.2.28:~/cabrito

echo "[Unit]
Description=Cabrito Web Service

[Service]
Type=simple
Restart=always
RestartSec=5s
User=tost
ExecStart=/home/tost/cabrito/cabrito-server-linux-intel
WorkingDirectory=/home/tost/cabrito

[Install]
WantedBy=multi-user.target" | sudo tee /lib/systemd/system/cabrito-server.service

sudo systemctl daemon-reload
sudo systemctl enable cabrito-server.service
sudo systemctl start cabrito-server.service
sudo systemctl status cabrito-server.service