### wifi interface stop & clean
```
ifconfig wlan0 0.0.0.0 down
```
### wifi interface up
# Interface name may be wlan[0-1]
```
ifconfig wlan0 up
```
### Find server SSID
```
iwlist wlan0 scanning | grep ESSID
```
### Edit wpa_supplicant.conf
```
screen -S wifiConnect -dm bash -c 'wpa_supplicant -Dnl80211 -i wlan0 -c /etc/wpa_supplicant.conf; exec sh'
```
### Get TCP settings on wifi interface from DHCP server
```
dhclient wlan0
```
### Setup complete

