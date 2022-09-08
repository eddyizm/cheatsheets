## AWS CLI 
---

### remove s3 bucket 

`awslocal s3 rm  s3://<bucket_path>/ --recursive`

### list buckets  

`awslocal s3api list-buckets`

### list bucket contents

`awslocal s3 ls /<BUCKET_NAME>/`

### get head object of bucket/key item  

`awslocal s3api head-object --bucket <BUCKET_NAME> --key <path/to/key>`
