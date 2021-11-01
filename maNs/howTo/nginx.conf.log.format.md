### nginx.conf
```
http {

log_format custom '$remote_addr - $remote_user [$time_local] "$request" '
                  '$status $body_bytes_sent "$http_referer" '
                  '"$http_user_agent" "$http_x_forwarded_for" $request_time $request_length $connection_requests $bytes_sent $upstream_connect_time $upstream_header_time $upstream_response_time';
```
### sites-enabled/$server_name.conf
```
access_log custom /var/log/nginx/sms.access.log custom;
```