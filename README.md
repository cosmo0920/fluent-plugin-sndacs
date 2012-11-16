Sndacs output plugin for Fluent event collector
=====

Configuration
-----

```
<match pattern>
  type sndacs

  access_key_id YOUR_ACCESS_KEY
  secret_access_key YOUR_SECRET_KEY
  bucket YOUR_BUCKET
  buffer_path /var/log/fluent/sndacs
</match>
```
