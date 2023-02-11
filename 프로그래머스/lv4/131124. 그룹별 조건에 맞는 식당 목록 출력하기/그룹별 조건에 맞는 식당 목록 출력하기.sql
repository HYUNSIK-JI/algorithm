SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, "%Y-%m-%d") AS REVIEW_DATE
FROM MEMBER_PROFILE AS A, REST_REVIEW AS B
WHERE A.MEMBER_ID = B.MEMBER_ID AND 
B.MEMBER_ID = (
    SELECT MEMBER_ID 
    FROM REST_REVIEW 
    GROUP BY MEMBER_ID 
    ORDER BY COUNT(REVIEW_ID) DESC
    LIMIT 1
    )
ORDER BY REVIEW_DATE, REVIEW_TEXT

# SELECT I.MEMBER_NAME, R.REVIEW_TEXT, SUBSTR(R.REVIEW_DATE, 1, 10) AS REVIEW_DATE
# FROM MEMBER_PROFILE AS I, REST_REVIEW AS R
# WHERE I.MEMBER_ID = R.MEMBER_ID AND R.MEMBER_ID = (
#     SELECT MEMBER_ID
#     FROM REST_REVIEW
#     GROUP BY MEMBER_ID
#     ORDER BY COUNT(REVIEW_ID) DESC
#     LIMIT 1
# )
# ORDER BY REVIEW_DATE, REVIEW_TEXT