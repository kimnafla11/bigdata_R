#작성일 : 20210924
#작성자 : 나은이
#수업 : 빅데이터분석실무
#내용 : for/while문 apply()


#1~10까지 출력 for문
for(i in 1:10){print(i)}

#1~10까지 출력 while문
number = 1
while(number<=10){
  print(number)
  number = number+1
}


###apply()####
#특정 명령을 반복 실행하는 대표적 내장함수
#행이나 열에 함수 적용해 결과 구할 때 활용

A = matrix(1:12, nrow = 4, byrow = T)
print(A)

#apply(X = 매트릭스, MARGIN = 1행방향 연산 2열방향 연산, FUN = 사용할 연산)
#margin : 계산 방향
#fun : mean, sum, class
apply(X=A, MARGIN = 1, FUN = sum)
apply(A, 2, sum)
