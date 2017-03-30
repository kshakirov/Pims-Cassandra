#!/usr/bin/env bash
curl -XDELETE 'http://10.1.3.15:9200/magento_product/product/_query' -d '{
    "query" : {
        "match_all" : {}
    }
}'