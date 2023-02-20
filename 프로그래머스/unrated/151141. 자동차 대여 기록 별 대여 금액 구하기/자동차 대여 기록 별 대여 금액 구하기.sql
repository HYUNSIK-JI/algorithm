SELECT B.HISTORY_ID, ROUND((DATEDIFF(B.END_DATE, B.START_DATE)+1) * A.DAILY_FEE * (
    CASE
        WHEN DATEDIFF(B.END_DATE, B.START_DATE)+1 < 7 THEN 1
        WHEN DATEDIFF(B.END_DATE, B.START_DATE)+1 < 30 THEN 0.95
        WHEN DATEDIFF(B.END_DATE, B.START_DATE)+1 < 90 THEN 0.92
        ELSE 0.85
    END
)) as FEE
FROM CAR_RENTAL_COMPANY_CAR AS A 
INNER JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS B ON A.CAR_ID = B.CAR_ID 
INNER JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN  AS C ON A.CAR_TYPE = C.CAR_TYPE
WHERE A.CAR_TYPE = "트럭"
GROUP BY B.HISTORY_ID
ORDER BY FEE DESC, B.HISTORY_ID DESC