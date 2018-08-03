# Sonnar Scanner CLI

Drone plugin for using with Sonnar Scanner CLI 3.x

## Usage
```yaml
pipeline:
  ...

  sonar:
    image: josebovet/drone-sonnar-scanner
    url: https://sonar.cloud.io
    project_key: my-secret
    source: src/main/java
    login: TOKEN
    project_name: MySecret
    project_version: 1.0
    log_level: DEBUG
    verbose: true

```
## Owner Team
Anonymous Team
