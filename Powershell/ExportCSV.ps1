# export csv from sql server
# database
$server = '<SERVER>'
$db = '<DATABASE>'

# required to get this to run on sql server agent. 
Set-Location c: 
# directories
$outDir = '<\\output directory\>'

# queries
$claimQuery = "<select column from table>" 
$eligQuery = "<select column from table>" 

#output claim status file    
$outputFile = 'FileName_' + (get-date -format yyyyMMdd) + '.txt'
$output = Join-Path $outDir $outputFile
Invoke-Sqlcmd -Query $claimQuery -serverinstance $server -database $db `
| Export-Csv -Path $output -NoType -Delimiter ';' 

#clean up quotes 
$File = Get-Content $output 
$File.Replace('"', "").TrimStart('"').TrimEnd('"') | Out-File $output -Force -Confirm:$false

#output claim status file    
$outputFile = 'Filename2_' + (get-date -format yyyyMMdd) + '.txt'
$output = Join-Path $outDir $outputFile
Invoke-Sqlcmd -Query $eligQuery -serverinstance $server -database $db `
| Export-Csv -Path $output -NoType -Delimiter '|' 

$File = Get-Content $output 
$File.Replace('"', "").TrimStart('"').TrimEnd('"') | Out-File $output -Force -Confirm:$false