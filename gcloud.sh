### google cloud cli

# show current configuration
gcloud config list

# get specific account values
gcloud config get-value account

# copying files from vm  
gcloud compute scp instance-1:/etc/apache2/apache2.conf %userprofile%/desktop/apache2.conf
gcloud compute scp instance-1:/home/eddyizm/sitefiles/eddyizm/main/main/settings.py %userprofile%/HP/backups/settings.py"

