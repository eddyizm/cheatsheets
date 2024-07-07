#!/bin/bash

# get string length with expr
expr length "Hello World"

### extend or change swapfile
# first turn it off
sudo swapoff /.swapfile 
# then increase by 1gb
sudo dd if=/dev/zero of=/.swapfile bs=1M count=1024 oflag=append conv=notrunc

# set it as the new swap file
sudo mkswap /.swapfile

# turn it back on
sudo swapon /.swapfile

### replace character in string (nice for changing delimiter in headers)
echo "$string" | tr xyz _ # where every instance of xyz is replaced with _

### reverse string 
[user@linux ~]$ echo tributum | rev
mutubirt

### display colours in terminal
for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
done

### increment variable 
var=$((var+1))
((var=var+1))
((var+=1))
((var++))

let "var=var+1"
let "var+=1"
let "var++"

### random number 
echo $RANDOM  

# random number between 666 and 1 (in a range)
echo $(( $RANDOM % 666 + 1))

### ghost script  
compress pdf 

`gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$file`  
	
to select pages  add these args

`-dFirstPage=pagenumber`
    
	Begin on the designated page of the document. Pages of all documents in PDF collections are numbered sequentionally.

`-dLastPage=pagenumber`


	
### Check what ports device is listening on

    netstat -tuplen  | grep LISTEN

### gpg encryption 

    # Generate keys 
    
    gpg --generate-key
    
    # List keys 
  
    gpg --list-keys
    
    # encrypt file - Do I need the user name?
    
    gpg -e -r USERNAME ~USERNAME/filename
    
    # decrypt file (without the output flag, it will decrypt to terminal. 
    gpg -d -o decrypted_file.txt 
    
### tailscale 
# install on debian buster


curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo apt-get update
sudo apt-get install tailscale

sudo tailscale up

# You’re connected! You can find your Tailscale IPv4 address by running:

tailscale ip -4


### fail2ban 
# install
sudo apt install fail2ban

# check status
systemctl status fail2ban.service
sudo fail2ban-client status

# create copy of config to local then edit local
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

sudo nano /etc/fail2ban/jail.local
# activate jail, set backend, set ban parameters, findtime and maxretry

# set up jail 
cd /etc/fail2ban

## check status of particular guard
sudo fail2ban-client status apache-auth

Status for the jail: apache-auth
|- Filter
|  |- Currently failed: 0
|  |- Total failed:     0
|  `- File list:        /var/log/apache2/error.log`
    - Actions
    |- Currently banned: 0
    |- Total banned:     0
    `- Banned IP list:`

# ban manually
sudo fail2ban-client set sshd banip 23.34.45.56

# whitelist 
ignoreip = 192.168.10.100 192.168.2.0/32

### get # day of the week 

DOW=$(date +%u)
echo $DOW

### view full date time stamp

### date
# set date time
# date -u {month}{day}{hour}{minute}{year}
date -u 1014230622

# set date
date -s '2022-11-12'

date -s '2022-11-12 15:27:00'

date --set="Sat Nov 12 19:27:00 2022"

# get yesterday date
yesterday=$(date -I -d '-1 day')

# count words or lines in file

wc -l myfile.sh.
wc -w myfile.sh.

# Set environment variable system wide
# add line to /etc/environment

MY_SECRET=password
source /etc/environment

# clone permissions 

chmod --reference=file1 file2
chmod --reference=dir1 dir2

# view file permission in number format
find [path] -printf '%m %p\n'

# make script executable by anyone 
chmod +x script.sh 
# or 
chmod 0755 script.sh

# check if any args are supplied
if [ "$#" -eq 0 ]
then
  echo "No arguments supplied"
  exit 1
fi

# bash script position args

test.sh > 
    echo "Username: $1";
    echo "Age: $2";
    echo "Full Name: $3";

./test.sh Bob420 420 'bob 420bitch'

# copy folder with CP command 

cp -avr /home/vivek/letters /usb/backup

-a : Preserve the specified attributes such as directory an file mode, ownership, timestamps, if possible additional attributes: context, links, xattr, all.
-v : Verbose output.
-r : Copy directories recursively.

# show jobs 
user@mysystem:~$ jobs
[1] + Stopped                python
user@mysystem:~$ 

# access said jobs . If only one program is stopped, you may use fg alone:
user@mysystem:~$ fg 1

# read file to variable 
ytlog=$(cat ~/HP/logs/yt.log | grep Destination)

echo "$ytlog"

# run commands when logging in via ssh 
if [ -n "$SSH_CONNECTION" ] ; then
        
        echo "commands here"
fi

# find files that start with numbers and strip the first 3 characters
for file in [0-9]*.txt; do echo "${file:3}" ; done

# c – creates a new archive
# v – verbose, meaning it lists the files it includes
# f – specifies the name of the file
# C - specify output folder
#   -x, --extract, --get       extract files from an archive

# tar directory into file
tar czf myfiles.tar.gz mydirectory/

# unpack tar files 
tar –xvf documents.tar -C Folder

# tar and max compress
tar cvf - FILE.VDI | gzip -9 - > FILE.VDI.tar.gz

#!/usr/bin/env bash read N lines of end of file and output
tail --lines=60 /C/Users/eddyizm/Source/Repos/seleniumTesting/env/log.txt > "/C/Users/eddyizm/Documents/My Dropbox/Dropbox/Apps/log.txt"

# rename files with pattern match 
for file in *.mp4; do mv $file "${file/<SEARCH_TEXT>/<REPLACEMENT_TEXT>}"; done

# rysnc back up folder *mirror*
rsync -avr --delete /Directory1/ /Directory2/

# rsync exclude
# passing a file or a folder
--exclude=exclude.txt 
--exclude Archive 

# dry run 
--dry-run

# schedule job on windows 10
"C:\Program Files\Git\usr\bin\bash.exe" #program
--login -i "/PATH.TO.SCRIPT/SCRIPT.sh" # arguments (path to your script)
# -i is interactive, should not be in this scheduled task
C:\Program Files\Git\usr\bin\  # start in directory. note: this needs to have NO QUOTES

# echo a folder batch script for mp4box

(echo -n "MP4Box "; for i in *.*4; do echo -n " -cat '$i'"; done; echo -n " output.mp4")

# make directory using current formatted date   

mkdir $(date +"%m-%d-%Y")

# format date 

    $ date -I
    2021-07-16
 
# find and delete empty folders 

find . -empty -type d -delete

# find and run action on found files or folders using OK to prompt user. 

eddyizm@local:~$ find . -iname test* -ok rm {} \;
< rm ... ./test.txt > ? 

# nmap 

# quick scan

nmap -sn 10.0.0.0/24

# a deep list of services and exposed ports 

nmap <IP> -sV -O -p1-65535

# make bash script executable 

chmod u+x deploy.sh

# arrays

Syntax	Result
arr=()	Create an empty array
arr=(1 2 3)	Initialize array
${arr[2]}	Retrieve third element
${arr[@]}	Retrieve all elements
${!arr[@]}	Retrieve array indices
${#arr[@]}	Calculate array size
arr[0]=3	Overwrite 1st element
arr+=(4)	Append value(s)
str=$(ls)	Save ls output as a string
arr=( $(ls) )	Save ls output as an array of files
${arr[@]:s:n}	Retrieve n elements starting at index s

# array loop 

# declare an array variable
declare -a arr=("element1" "element2" "element3")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also

### cli image (imagemagick) editing ###

sudo apt-get install imagemagick
# mogrify overwrites original image
mogrify -resize 50% *.png      # keep image aspect ratio
mogrify -resize 320x240 *.png  # keep image aspect ratio
mogrify -resize 320x240! *.png # don't keep image aspect ratio
mogrify -resize x240 *.png     # don't keep image aspect ratio
mogrify -resize 320x *.png     # don't keep image aspect ratio

# resize image
convert -resize 50% myfigure.png myfigure.jpg
convert myfigure.png -resize 200x100 myfigure.jpg

# loop through directory of files  
for img in *.jpg; do
  convert -resize 20% "$img" "opt-$img"
done

# padding images and squaring them with white background  

convert -background white -gravity center   \
     DSC00449.jpg -resize 1000x1000 -extent 1000x1000 result.jpg

# create large dummy file fast
 dd if=/dev/urandom of=random.img count=1024 bs=10M  # 1024 = 10GB
 
