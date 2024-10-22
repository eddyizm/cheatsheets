-- Case select statement 
 (SELECT TOP 1 DIVISION FROM dbo.Technician t WHERE t.EMPLOYID=a.TechID),
            (CASE WHEN 1=1 THEN (SELECT MAX(DIVISION) FROM dbo.TechnicianDiv t WHERE t.EMPLOYID=a.TechID) ELSE '' END) AS TechDivision
			

-- Case When 
(CASE -- START WITH CASE, must have an END
	WHEN g.REF_UNBILLEDTYPE_PK IS NOT NULL -- Condition  sort of like an IF or SWITCH 
	THEN  g.DESCRIPTION -- If true, falls into then result
	ELSE   RTRIM(a.JOB_NUMBER) -- ELSE ends up here to close. with an END 
	END) AS JOB_NUMBER, -- in a select statement. 

-- Case when used in an ISNULL scenerio
ISNULL(CASE WHEN f.JOB_NAME IS NULL THEN h.ADRSCODE ELSE f.JOB_NAME END, '') AS JOB_NAME 
		