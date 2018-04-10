# cockpit-project
[http://cockpit-project.org/](http://cockpit-project.org/)


/etc/cockpit/cockpit.conf
```
[WebService]
Origins = https://aws.foobars.in
AllowUnencrypted = true
UrlRoot = /console/
```

/etc/systemd/system/cockpit.socket.d/listen.conf
```
[Socket]
ListenStream=
ListenStream=443
ListenStream=8085
```

Reload Cockpit
```
sudo systemctl daemon-reload
sudo systemctl restart cockpit.socket
```
