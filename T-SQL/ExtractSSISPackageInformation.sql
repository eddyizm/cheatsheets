/*
Copy SSIS packages from MSDB SQL SERVER 2008 R2 to another SQL SERVER 2008 R2.  

Requires command line utility dtutil:
    C:\Program Files (x86)\Microsoft SQL Server\130\DTS\Binn\dtutil.exe
    (Path varies on verison ie. 130)
Notes: 
    Assumes default instance and localhost.
    File extraction command line
    'dtutil /sourceserver localhost /SQL "'+ F.FolderPath + '\' + P.PackageName + '" /copy file;".\' + P.PackageName +'.dtsx"' AS cmd

Credit for origina base code: 
    https://dba.stackexchange.com/questions/68481/moving-ssis-packages-to-new-server
*/

WITH FOLDERS AS
(
    -- Capture root node
    SELECT
        cast(PF.foldername AS varchar(max)) AS FolderPath
    ,   PF.folderid
    ,   PF.parentfolderid
    ,   PF.foldername
    FROM
        msdb.dbo.sysssispackagefolders PF
    WHERE
        PF.parentfolderid IS NULL

    -- build recursive hierarchy
    UNION ALL
    SELECT
        cast(F.FolderPath + '\' + PF.foldername AS varchar(max)) AS FolderPath
    ,   PF.folderid
    ,   PF.parentfolderid
    ,   PF.foldername
    FROM
        msdb.dbo.sysssispackagefolders PF
        INNER JOIN
            FOLDERS F
            ON F.folderid = PF.parentfolderid
)
,   PACKAGES AS
(
    -- pull information about stored SSIS packages
    SELECT
        P.name AS PackageName
    ,   P.id AS PackageId
    ,   P.description as PackageDescription
    ,   P.folderid
    ,   P.packageFormat
    ,   P.packageType
    ,   P.vermajor
    ,   P.verminor
    ,   P.verbuild
    ,   suser_sname(P.ownersid) AS ownername
    FROM
        msdb.dbo.sysssispackages P
)
SELECT 
    -- sample output required for command line usage
	-- dtutil /SQL "\Package1" /SOURCEUSER <username> /SOURCEPASSWORD <password> /DestServer <DESTINATIONSERVER> /COPY SQL;"\Package1" /DESTUSER <username> /DESTPASSWORD <password>
	-- Move Package command line
    'dtutil /SQL "'+ F.FolderPath + '\' + P.PackageName + '" /SOURCEUSER <username> /SOURCEPASSWORD <password> /DestServer <DESTINATIONSERVER> /COPY SQL;"'+ F.FolderPath + '\' + P.PackageName + '" /DESTUSER <username> /DESTPASSWORD <password>' AS cmd
FROM 
    FOLDERS F
    INNER JOIN
        PACKAGES P
        ON P.folderid = F.folderid
 WHERE
     F.FolderPath <> '\Data Collector'