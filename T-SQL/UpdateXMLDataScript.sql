/* Simplest way to edit single entry in XML column*/

DECLARE @t TABLE ( rowId INT IDENTITY PRIMARY KEY, yourXML XML )

INSERT INTO @t ( yourXML )
VALUES ( '<Users>
    <User Name="Bob"></User>
    <User Name="Mikhail"></User>
    <User Name="John"></User>
    <User Name="Sue"></User>
</Users>' )

SELECT 'before' s, DATALENGTH(yourXML) dl, yourXML
FROM @t
WHERE rowId = 1

-- Update one attribute
UPDATE @t
SET yourXML.modify('replace value of (Users/User/@Name[.="Bob"])[1] with "wBob"')
WHERE rowId = 1

SELECT 'after' s, DATALENGTH(yourXML) dl, yourXML
FROM @t
WHERE rowId = 1