import boto3 

# write list to s3 bucket directly
output_list = ['item1', 'item2', 'item3']
s3_client = boto3.client("s3")
s3_client.put_object(
    Body="\n".join(output_listr)
    Key=file_name,
    Bucket=bucket_name,
)

# s3 list buckets
s3 = boto3.client('s3')
object_listing = s3.list_objects_v2(Bucket='bucket_name',
                                    Prefix='folder/sub-folder/')
