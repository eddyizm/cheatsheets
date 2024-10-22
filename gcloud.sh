### google cloud cli

# show current configuration
gcloud config list

# get specific account values
gcloud config get-value account

# copying files from vm  
gcloud compute scp instance-1:/etc/apache2/apache2.conf %userprofile%/desktop/apache2.conf
gcloud compute scp instance-1:/etc/settings.py %userprofile%/HP/backups/settings.py

# copy directory recursively from vm.
gcloud compute scp --recurse instance-1:/etc/media %userprofile%/HP/backups/data/

# copying files from local to vm  
gcloud compute scp [LOCAL_FILE_PATH] [INSTANCE_NAME]:~/[remote path]]
    