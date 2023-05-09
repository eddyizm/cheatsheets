# AWS CLI 
---

### create s3 bucket  

```
aws s3api create-bucket \
    --bucket my-bucket \
    --region us-east-1
```

### copy item from s3 to local

`aws s3 cp s3://bucket/folder/file.txt .`

### copy item from local to s3  

`aws s3 cp ./localfile.txt s3://bucket/`

### remove s3 bucket contents

`aws s3 rm  s3://<bucket_path>/ --recursive`

### remove s3 bucket 

`aws s3api delete-bucket --bucket my-bucket --region us-east-1`

### list buckets  

`aws s3api list-buckets`

### list bucket contents

`aws s3 ls /<BUCKET_NAME>/`

### get head object of bucket/key item  

`aws s3api head-object --bucket <BUCKET_NAME> --key <path/to/key>`


### copy s3 bucket  

```  

aws s3 mb s3://[new-bucket]
aws s3 sync s3://[old-bucket] s3://[new-bucket]
aws s3 rb --force s3://[old-bucket]  

```

### move file  
```
aws s3 mv s3://mybucket/test.txt s3://mybucket2/  
``` 

## DynamoDB 
---
Create table

```
awslocal dynamodb create-table \
    --attribute-definitions AttributeName=<ATT_NAME>,AttributeType=S \
    --key-schema AttributeName=<ATT_NAME>,KeyType=HASH \
    --table-name <TABLE_NAME> \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
```

Get table information

```
aws dynamodb describe-table --table-name my-aws-table
```


Scan Table to get list of records

`aws dynamodb scan --table-name my-table-name`


Get Item

```
awslocal dynamodb get-item \
    --table-name <TABLE_NAME> \
    --key '{"Username": {"S": "Bob"}}'
```

`aws dynamodb get-item --table-name Users --key '{"Username": {"S": "bob"}}`


Delete Item

```
aws dynamodb delete-item \
    --table-name <TABLE_NAME> \
    --key '{"user_id": { "S": "USER68513334" }}'

```

Delete Table

`aws dynamodb delete-table --table-name <TABLE_NAME>`

Put Item 
```  
aws dynamodb put-item \
    --table-name <TABLE_NAME>  \
    --item \
        '{"unique_key": {"S": "id_field"}, "field1_date": {"S": "2020-01-01"}, "field2_date": {"S": "2022-12-31"}}'
```

Put Item via json file

```
aws dynamodb put-item \
    --table-name MusicCollection \
    --item file://item.json \
    --return-consumed-capacity TOTAL \
    --return-item-collection-metrics SIZE

```
## SQS  
Create queue
```
  aws sqs create-queue --queue-name sample-queue
  {
      "QueueUrl": "http://localhost:4566/000000000000/sample-queue"
  }
```
Delete queue 
```  
 aws sqs delete-queue --queue-url http://localhost:4566/00000000000/sample-queue
```  

List queues
```  
  aws sqs list-queues
  {
      "QueueUrls": [
          "http://localhost:4566/000000000000/sample-queue"
      ]
  }  
```
Send message to queue  
```  
awslocal sqs send-message --queue-url http://localhost:4566/00000000000/sample-queue --message-body test
{
    "MD5OfMessageBody": "098f6bcd4621d373cade4e832627b4f6",
    "MessageId": "74861aab-05f8-0a75-ae20-74d109b7a76e"
}
```
Retrieve a message from queue (no filters)
```
aws sqs receive-message --queue-url http://localhost:4566/00000000000/sample-queue --attribute-names All --message-attribute-names All 
# add to retrieve more than one
--max-number-of-messages 10  
```
