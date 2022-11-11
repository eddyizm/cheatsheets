# powershell cheatsheet
##############################################

# restart computer

Restart-Computer -force # force restart

# handbrake batch processing
$filelist = Get-ChildItem D:\Video\ -filter *.wmv

ForEach ($file in $filelist)
{
    $oldfile = $file.DirectoryName + "\" + $file;
    $newfile = $file.DirectoryName + "\" + $file + ".mp4";
	Start-Process "C:\Program Files (x86)\myapp.exe" -ArgumentList "-i `"$oldfile`"  -o `"$newfile`" " -Wait -NoNewWindow
}

# delete files older than N days

$Folder = "G:\Downloads"

Get-ChildItem $Folder -Recurse -Force -ea 0 |
? {!$_.PsIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-180)} |
ForEach-Object {
   $_ | del -Force
   $_.FullName | Out-File C:\Users\<LOGPATH>\deletedlog.txt -Append
}

# Delete empty folders and subfolders

Get-ChildItem $Folder -Recurse -Force -ea 0 |
? {$_.PsIsContainer -eq $True} |
? {$_.getfiles().count -eq 0} |
ForEach-Object {
    $_ | del -Force
    $_.FullName | Out-File C:\log\deletedlog.txt -Append
}

# test firewall port (sftp in this case) 

Test-NetConnection -ComputerName sftp.givecampus.com -Port 22   

# function with args

function RunAgainstDB([String] $db, [String] $base)
    # code here
}

# wrap code into function. 

function MyFunction {    
 # your code here
}


# not equal

"item 1" -ne "item 2"

# list .net versions installed on windows 10 systems

Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -Recurse | Get-ItemProperty -Name version -EA 0 | Where { $_.PSChildName -Match '^(?!S)\p{L}'} | Select PSChildName, version

# try catch blocks 

try {
    # logic
    }
catch {
    # generic catch all error
    Write-Host "An error occurred:"
    Write-Host $_.ScriptStackTrace
}

# multiline command

use backticks `

# read lines of file and run command against them

```
foreach($line in Get-Content .\file.txt) 
    {
        # Work here
    }
```

# concat strings

    Write-Host "processing scripts on $server $db"
    

#turn on error handling for running PS in sql server agent
    
    $ErrorActionPreference = "Stop"

# foreach loop
``` 
$letterArray = "a","b","c","d"
foreach ($letter in $letterArray)
{
  Write-Host $letter
}
``` 

# export csv files from sql server 
# requires module 
# Install-Module -Name SqlServer
``` 
$server = 'SQLSERVER'
$destDir =  'C:\Dest'
$db = 'Database'
$varDate = get-date -format yyyyMMdd
$outputFile = 'file_' + $varDate + '.txt'
$output = Join-Path $destDir $outputFile
Invoke-Sqlcmd -InputFile 'test.sql' -serverinstance $server -database $db `
    | Export-Csv -Path $output -NoType -Delimiter '|'
```

# call powershell and pass it arguments to execute command 
powershell -c "Start-ScheduledTask -TaskName 'post_image_twitterbot'"

# start task   
Start-ScheduledTask -TaskName "ScanSoftware"

# Scheduled Tasks
Get-ScheduledTask # list

# path
Get-ScheduledTask -TaskPath "\UpdateTasks\*"

# single task 
Get-ScheduledTask -TaskName "DailyMacPull"

# get task info  
Get-ScheduledTaskInfo -TaskName "\Sample\SchedTask01"

# start scheduled task
Start-ScheduledTask -TaskName "ScanSoftware"

# start all tasks in folder  
Get-ScheduledTask -TaskPath "\UpdateTasks\UpdateVirus\" | Start-ScheduledTask

# output directory 
tree 
#pass path
tree c:\path
# with files
tree /f

# Get history 
Get-History

# move item  
Move-Item -Path C:\test.txt -Destination E:\Temp\tst.txt

# query file and match pattern / Where context gives you pre,post N lines. 
PS> Select-String -Pattern "case" -Context 1,2 poet.txt

# write to output
Write-Host "******** Hello World **********"

# read input to variable 
$directoryToClean = Read-Host 'Please enter the directory to clean...'

# remove spaces from files in directory (can specify files only with switch -File)
Get-ChildItem -File $directoryToClean | Rename-Item -NewName { $_.Name -replace ' ','' }

# read file into body of email where $fullFilePath is a text file.
$emailBody = Get-Content -Path $fullFilePath -Raw

# remove duplicate lines from text file (first sort)
$filename | sort | get-unique > $newfileName

# get version
Get-Host | Select-Object Version

# pipe output to html
Get-Alias | ConvertTo-Html | Out-File aliases.htm

# tail file
Get-Content ./log.log -Tail 10

# gets the last 10 lines of the file and waits for more
Get-Content ./log.log -Wait -Tail 10 

# Also, for those *nix users, note that most systems alias cat to Get-Content, so this usually works
cat \\<DIRECTORY>\<FILE.log> -Tail 25

# tail and grep using regex eg grab only date
cat .\info.log -Tail 25 | where {$_ -match "2022-03-21"}

# get date and format
get-date 

get-date -format yyyyMMdd
# output: 20190405

# assign to variable
$varDate = get-date -format s
echo $varDate
# output: 2019-04-05T08:01:29

# convert object to string 
$object_variable | out-string

# Send an email (with no body) from User01 to User02: (missing smtp server)
send-mailmessage -to "User01 <user01@example.com>" -from "User02 <user02@example.com>" -subject "Test mail" -body "hello world" -smtpServer "<SERVER.DOMAIN.COM>" 
# add for html, preface -body with:
-bodyashtml 

# assign variable with dollar sign $
$varTemp = "whatever"

# get last write time of file list and pipe to foreach
ls $directory | Foreach {$_.LastAccessTime}

# get files last written to within the last 7 days 
ls $directory | Where{$_.LastWriteTime -gt (Get-Date).AddDays(-7)}

# check if variable is null (returns True / False)
$variable -eq $null

# check if  is greater than
if(1 -gt 0) 

# call exe from powershell
Start-Process -FilePath "C:\Program Files\IIS\Microsoft Web Deploy\msdeploy.exe" 

# and add redirect output
-RedirectStandardOutput  "Testsort.txt"

# Syntax for IF STATEMENT
      if ( condition ) { commands_to_execute }
      [ elseif ( condition2 ) { commands_to_execute } ]
      [ else {commands_to_execute} ]

# Key
   # Condition  An expression that will evaluate to true or false,
              # often utilising one or more comparison operators.

   # commands_to_execute
              # A PowerShell or external command to run if the condition is true.

# run tfs cli and email output
c:
cd "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE"
$lastfifty = .\tf history $/<TFS PROJECT> /format:brief /noprompt /recursive /stopafter:50 | Out-String
$dateSent =  get-date -format yyyy-MM-dd
$vSubject = "TFS Log " + $dateSent
$vBody = $lastfifty 
send-mailmessage -to "YOURNAME <you@email.com>", "YOURNAMETWO <you@email.com>" -Cc "YOUR NAME <you@email.com>"  -from "FROM EMAIL <from@email.com>"-subject $vSubject -body $vBody -smtpServer "mail.SMTPSERVER.com"
