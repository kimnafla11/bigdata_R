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
plot(model$fitted.values)
