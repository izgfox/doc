### Пользователь root
```
chmod u+s /usr/bin/screen
chmod 755 /var/run/screen
```

```
screen -dmS telegraf
screen -r telegraf -X multiuser on 
screen -r telegraf -X acladd alice
```

```
export http_proxy='' && telegraf --debug
```
### Пользователь alice
```
screen -x root/telegraf
```
