#작성일 : 20210924
#작성자 : 나은이
#수업 : 빅데이터분석실무
#내용 : 기본내장함수수

df = iris
class(df)
#data.frame구조임
str(df)
#str()함수를 활용하면 데이터 전체 구조를 알 수 있다.
#관측치 수, 변수 수, 변수별 자료형

summary(df)
#데이터 통계량 요약
#최소값, 최대값, 평균 등등

fix(df)
View(df)
#전체 데이터를 볼 수 있음

write.csv(df, 'c:/data/iris.r')
#데이터 저장가능