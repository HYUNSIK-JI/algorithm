SELECT PT_NAME, PT_NO, GEND_CD, AGE,
CASE
    WHEN TLNO IS NULL THEN 'NONE'
    WHEN TLNO IS NOT NULL THEN TLNO
END AS TLNO
FROM PATIENT
WHERE AGE <= 12 AND GEND_CD = "W"
ORDER BY AGE DESC, PT_NAME