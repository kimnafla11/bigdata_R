#작성자 : 나은이
#작성일자 : 20211011
#프로그램 목적 : 빅데이터분석실무 실습
#내용 : R기초, 벡터 리스트 데이터프레임 매트릭스

# 1. 벡터 c(), seq()
이름 = c("ㅅㅇ","ㅅㅎ","ㅇㄱ","ㅊㄱ","ㅅㅎ","ㄱㅎ","ㅌㅇ")
이름[1] #특정 주소 호출
이름[-2] #특정 주소 제외
이름[4:7] #범위 호출

# 2. 리스트 list()
재력 = c(4,5,6,7,9,4,10)
성격 = c(1,-10,-1,7,6,3,9)
와꾸 = c(2,4,8,7,2,5,5)
속궁합 = c(2,5,5,3,5,5,0)
년도 = c(14,16,17,17,20,20,21)

ㅅㅇ = list(
  이름 = 이름[1],
  재력 = 재력[1],
  성격 = 성격[1],
  와꾸 = 와꾸[1],
  속궁합 = 속궁합[1],
  년도 = 년도[1]
)

ㅅㅇ$와꾸

# 3. 데이터프레임 data.frame()
전남친 = data.frame(이름, 재력, 성격, 와꾸, 속궁합, 년도)
전남친$와꾸
전남친[1]
전남친[-1]
전남친[1:2]
전남친[5:7,1:2]

# 4. 매트릭스 matrix(0, row, col)
mat = matrix(c(1,2,3,4), nrow = 2) #2x2
mat = matrix(c(1,2,3,4,5,6), nrow = 2) #3x2
mat = matrix(0,2,10) #10x2
mat = matrix(0,10,1) #데이터 저장용 빈 매트릭스 선언

# 5. 데이터 확인하기
names(전남친) # col 이름
head(전남친) # 데이터 몇개 출력
str(전남친) # 데이터 구조
summary(전남친) # 데이터 전체 통계량 가늠


# 6. 시각화
#install.packages("ggplot2")
library(ggplot2)
ggplot(data = 전남친, aes(x = 전남친$년도, y = 전남친$재력))+ geom_point() + stat_smooth(color="red", method = "lm", se=FALSE)+geom_text(x=20,y=7,label="y=0.6029x-4.3382")+geom_text(x=20,y=6.5,label ="R2=0.3028")
summary(lm(전남친$재력~전남친$년도, data = 전남친))
model = lm(전남친$재력~., data = 전남친)
#adj.R^2 = 0.3028
