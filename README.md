# registry

* Ruby 2.1.2

* Mongodb

create a figaro file to hold secrets `config/application.yml`

```yml
AWS_ACCESS_KEY_ID: "ABC123"
AWS_SECRET_ACCESS_KEY: "abc123"

development:
  S3_BUCKET_NAME: "registry-development"

production:
  S3_BUCKET_NAME: "registry-production"

```
