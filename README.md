Sndacs output plugin for [Fluentd](http://fluentd.org) event collector
=====

Installation
-----

Simply use RubyGems:
```
gem install fluent-plugin-sndacs
```

Configuration
-----

```
<match pattern>
  type sndacs

  access_key_id YOUR_ACCESS_KEY
  secret_access_key YOUR_SECRET_KEY
  bucket YOUR_BUCKET
  path logs/
  buffer_path /var/log/fluent/sndacs
</match>
```
