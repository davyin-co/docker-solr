## 介绍
1. log4j使用最新的2.15.0替换镜像自带的2.11.0版本
2. 已经安装了ik-analyzer jar包
3. 默认创建名为drupal的solr core
4. 如果需要创建更多core,执行如下命令:
```
solr create -c [core-name] -d server/solr/configsets/drupal/conf -n [core-name];
```

## docker-compose.yml sample
```
version: '3'
services:
  solr7:
    image: davyinsa/solr:7
    container_name: solr7
    ports:
      - "8983:8983"
    volumes:
      - ./data:/opt/solr/server/solr
    command: bash -c "cp -r /opt/solr/server/solr-orig/* /opt/solr/server/solr/;docker-entrypoint.sh solr start -c; solr create -c drupal -d server/solr/configsets/drupal/conf -n drupal; solr restart -c -f"
```
