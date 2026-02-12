SELECT
    s.name AS JobName,
    l.name AS JobOwner
FROM
    msdb..sysjobs s
    LEFT JOIN master.sys.syslogins l ON s.owner_sid = l.sid
WHERE
    l.name IS NULL
ORDER by
    1