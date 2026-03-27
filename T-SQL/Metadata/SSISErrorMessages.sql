use SSISDB;

-- SSIS error message details
SELECT
    top 1000 OPR.object_name,
    MSG.message_time,
    MSG.message,
    MSG.message_type
FROM
    catalog.operation_messages AS MSG
    INNER JOIN catalog.operations AS OPR ON OPR.operation_id = MSG.operation_id
WHERE
    MSG.message_type = 120
order by
    MSG.message_time DESC