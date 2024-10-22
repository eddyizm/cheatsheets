/* 
SELECTING DATA INTO XML FORMAT 
*/

DECLARE @XmlOutput xml
SET @XmlOutput =
	(
		-- The actual xml conversion
		Select
		TOP 10 LogID, EventID , Priority, Severity, 
		Title
	    from dbo.Log (NOLOCK)
		FOR XML AUTO, ROOT('Log_Entries'),ELEMENTS
	)
SELECT @XmlOutput

Select TOP 10
		LogID, EventID, Priority, Severity, 
		Title  
		from dbo.Log (NOLOCK)