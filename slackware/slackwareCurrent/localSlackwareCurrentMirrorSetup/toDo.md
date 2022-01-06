## Generate local mirror for slackware current
### Get script and prepare directory for mirror
```
wget http://www.slackware.com/~alien/tools/mirror-slackware-current.sh
chmod +x mirror-slackware-current.sh
mkdir -pv slackware64-current
```
### Run rsync with -m option that set nearest mirror 
**Example set russian rsync mirror from  https://mirrors.slackware.com/mirrorlist/**
```
ARCH=x86_64 \
./mirror-slackware-current.sh \
-l . \
-X none \
-m slackware.tsu.ru::slackware/slackware64-current \
-o NONE
```
