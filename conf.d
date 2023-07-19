input {
  beats {
    port => 5044
  }
}
filter {
    grok {
        match => { "message" => "%{SYSLOGLINE}"}
    }
}
output {
  elasticsearch {
    hosts => ["http://localhost:9200"]
    index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
  }
}