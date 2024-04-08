import boto3 

# write list to s3 bucket directly
output_list = ['item1', 'item2', 'item3']
s3_client = boto3.client("s3")
s3_client.put_object(
    Body="\n".join(output_list)
    Key=file_name,
    Bucket=bucket_name,
)

# s3 list buckets
s3 = boto3.client('s3')
object_listing = s3.list_objects_v2(Bucket='bucket_name',
                                    Prefix='folder/sub-folder/')


import s3fs
# download and stream file directly while decompressing.
fs = s3fs.S3FileSystem()  # s3fs always reads in binary
with fs.open(path=<file>, mode='rb', compression='infer') as file_stream:
    # download and stream file
    fs.write_text(path=<s3_destination_path>, value=file_stream.read().decode('utf-8'), encoding='utf-8')
