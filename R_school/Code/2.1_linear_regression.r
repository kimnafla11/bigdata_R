#작성자 : 나은이
#작성일 : 2021년 10월 6일
#제목 : 선형회귀(linear regression)
data = datasets::mtcars
names(data)
str(data)
head(data)
fix(data)

plot(data$mpg, data$wt)
#mpg가 커지면 커질수록 wt는 낮아지는 그림

plot(data$hp, data$wt)
#hp가 커지면 커질수록 wt는 높아지는 느김

cor(data)
#상관관계 correlation matrix

cov(data)
#공분산행렬

##############
head(data)
df = data[,1:6]
head(df)

model = lm(df$wt~df$mpg+df$cyl+df$disp+df$hp+df$drat,data = df)
#lm모델 만듦

sum((model$residuals)^2)
#잔차제곱합

model$coefficients
#기울기(베타값)

model$fitted.values
#예측값(y햇) 
plot(df$wt,model$fitted.values)

summary(model)
#summary결과표에 별표따라 베타 값을 너무 신뢰해서는 안됨
#x끼리 상관관계가 너무 높을때 어떤 y를 설명할때 신뢰하기 어려운현상인 다중공선성 문제 발생 가능
#R2가 높으면 F통계량도 높은경향이 있다


####선형대수학으로 linear regression 해보기####
typeof(df)
class(df) #데이터프레임은 선형대수로 표현하기 어려움

x = as.matrix(df[,1:5])
class(x)
y = as.vector(df[,6])
class(y)

x = cbind(matrix(1,nrow=nrow(x)),x) #x매트릭스에 1을 추가함
y

#solve() 역행렬 함수
hat = solve(t(x) %*% x)%*%(t(x)%*%y)
print(hat)

model$coefficients
#우와 존나 신기하다.
yhat= x %*% hat

plot(model$fitted.values, yhat)