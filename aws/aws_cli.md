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

### sync using filters  
`aws s3 sync s3://my-bucket/ ./csv_files/ --exclude "*" --include "*.csv"`

### copy item from local to s3  

`aws s3 cp ./localfile.txt s3://bucket/`

### remove item from s3  

`aws s3 rm s3://bucket/localfile.txt`  

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
### get summary information 

`aws s3 ls s3://bucket/ --human-readable --summarize`

### same but recursively

`aws s3 ls s3://bucket/ --human-readable --recursive --summarize`

Piping it out to sed to make the file pipe delimited and into a csv for easier analysis
`sed "s/ /\|/g" | sed "s/||||/\|/g" | sed "s/|||/\|/g" | sed "s/||/\|/g" > results.csv`

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
      "QueueUrl": "http://localhost:4566/80398EXAMPLE/sample-queue"
  }
```
Delete queue 
```  
 aws sqs delete-queue --queue-url http://localhost:4566/80398EXAMPLE/sample-queue
```  

List queues
```  
  aws sqs list-queues
  {
      "QueueUrls": [
          "http://localhost:4566/80398EXAMPLE/sample-queue"
      ]
  }  
```
Send message to queue  
```  
awslocal sqs send-message --queue-url http://localhost:4566/80398EXAMPLE/sample-queue --message-body test
{
    "MD5OfMessageBody": "098f6bcd4621d373cade4e832627b4f6",
    "MessageId": "74861aab-05f8-0a75-ae20-74d109b7a76e"
}
```
Retrieve a message from queue (no filters)
```
aws sqs receive-message --queue-url http://localhost:4566/80398EXAMPLE/sample-queue --attribute-names All --message-attribute-names All 
# add to retrieve more than one
--max-number-of-messages 10  
```
After retrieving a message, delete the message from queue using the receipt handle  
```  
aws sqs delete-message --queue-url https://sqs.us-east-1.amazonaws.com/80398EXAMPLE/MyQueue --receipt-handle <RECEIPT HANDLE>
```  
## Glue 

aws classifier (used with crawler)

```
aws glue create-classifier \
    --csv-classifier '{
        "Name": "custom-pipe-classifier",
        "Delimiter": "|",
        "QuoteSymbol": "\"",
        "ContainsHeader": "UNKNOWN"
    }'
```

Create crawler
```
aws glue create-crawler \
--name "dev-crawler" \
--role "<ARN ROLE>" \
--database-name "<DB NAME>" \
--targets 'S3Targets=[{Path="s3://<FULL S3 PATH"}]' \
--classifiers "custom-pipe-classifier" \
--configuration '{"Version": 1.0, "CrawlerOutput": {"Partitions": {"AddOrUpdateBehavior": "InheritFromTable"}, "Tables": {"AddOrUpdateBehavior": "MergeNewColumns"}}, "Grouping": {"TableLevelConfiguration": 5}}'      
```

then run  
```
aws glue start-crawler --name dev-crawler
```

## SSM  

put parameter
```
aws ssm put-parameter \
    --region ap-southeast-1 \
    --name GPG_PRIVATE_KEY \
    --type SecureString \
    --value file://my_github_private.key
```
get parameter
```
aws ssm get-parameter \
    --name /<name_or_path_of_param/my_github_private
```


