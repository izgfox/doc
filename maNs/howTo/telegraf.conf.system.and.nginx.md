### outputs : influxdb (пример json файл)
### inputs : system telemetry (/proc parser set), tail nginx access log(типизация данных по стандартам ELK стека) 
<https://discuss.elastic.co/t/logstash-basic-grok-field-types-description>
```
[global_tags]
[agent]
  interval = "10s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "0s"
  flush_interval = "10s"
  flush_jitter = "0s"
  precision = ""
  debug = false
  quiet = false
  hostname = "sms_prod_app"
  omit_hostname = false
[[outputs.influxdb]]
  urls = ["http://22.178.242.102:8086"]
  database = "sms_prod"
  write_consistency = "any"
  timeout = "5s"
#[[outputs.file]]
#  files = ["stdout", "/storage/output.emulator.json"]
#  data_format = "json"
#  json_timestamp_units = "10s"
[[inputs.tail]]
  files = ["/var/log/nginx/sms.access.log"]
  from_beginning = false
  pipe = false
  watch_method = "inotify"
  max_undelivered_lines = 10000
  name_override = "nginx"

  grok_patterns = ["%{CUSTOM_LOG_BEHIND_PROXY}","%{CUSTOM_LOG_NO_PROXY}","%{COMBINED_LOG}","%{COMMON_LOG}"]
  grok_custom_patterns = '''
      CUSTOM_LOG_BEHIND_PROXY %{COMBINED_LOG_FORMAT} %{WORD:x_forwarded_for:tag} %{NUMBER:request_time:float} %{NUMBER:request_length:int} %{NUMBER:connection_requests:int} %{NUMBER:bytes_sent:int} %{NUMBER:upstream_connect_time:float} %{NUMBER:upstream_header_time:float} %{NUMBER:upstream_response_time:float}
      CUSTOM_LOG_NO_PROXY %{COMBINED_LOG_FORMAT} %{NUMBER:request_time:float} %{NUMBER:request_length:int} %{NUMBER:connection_requests:int} %{NUMBER:bytes_sent:int} %{NUMBER:upstream_connect_time:float} %{NUMBER:upstream_header_time:float} %{NUMBER:upstream_response_time:float}
      COMBINED_LOG %{COMBINED_LOG_FORMAT}
      COMMON_LOG %{COMMON_LOG_FORMAT}
     '''
	 
  data_format = "grok"
[[inputs.cpu]]
  percpu = true
  totalcpu = true
  collect_cpu_time = false
  report_active = false
  fielddrop = ["time_*"]
[[inputs.disk]]
  ignore_fs = ["tmpfs", "devtmpfs", "devfs", "iso9660", "overlay", "aufs", "squashfs"]
[[inputs.diskio]]
[[inputs.kernel]]
[[inputs.mem]]
[[inputs.processes]]
[[inputs.swap]]
[[inputs.system]]
[[inputs.interrupts]]
[[inputs.net]]
[[inputs.netstat]]
```