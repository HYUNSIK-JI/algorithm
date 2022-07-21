# 정수 1 (1) 1가지
# 정수 2 (1,1),(2) 2가지
# 정수 3 (1,1,1),(1,2),(2,1),(3) 4가지
# 정수 4 (1,1,1,1),(1,1,2),(1,2,1),(2,1,1),(2,2),(1,3),(3,1) 7가지

# 다음 n번째 수는 dp[n] = dp[n - 3] + dp[n - 2] + dp[n - 1] 이라는 점화식을 얻을수 있다.
# 이 점화식 이용해 풀게 되면 시간 제한 없이 쉽게 풀수 있다.
# n의 범위는 11보다작다 즉 경우의 수를 저장 해야 할 숫자는 0를 포함해 1~10 이라는 말이다.
# 0~10까지 이므로 11개를 입력해야 한다.
# 테스트케이스 들어 가기 전 각각 n에 대해 경우의 수를 저장 해야 시간의 효율성 가져 갈수 있기 때문에 미리 저장.
import sys

input=sys.stdin.readline

dp = [0] * 11

dp[1] , dp[2] , dp[3] , dp[4] = 1, 2, 4, 7

for i in range(4 , 11):
    dp[i] = dp[i - 3] + dp[i - 2] + dp[i - 1]

for test_case in range(int(input())):
    n = int(input())
    print(dp[n])