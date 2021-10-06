######미분 함수♥
##차분 함수 만듦
fd = function(f,x, h = x*sqrt(.Machine$double.eps)){
  #h는 매우 작은 값
  return((f(x+h)-f(x))/h) #차분
}

#
f = function(x) -x^2 + 6*x -6
curve(f, -5,10) #-5에서 10까지 f를 시각화

fd(f,2,h = 0.1)#x값이 2일때의 미분 값

fd(f,2,h = 0.00000000001)#h가 아주 작을 때 정확한 미분값에 근사해진다.


##real mi bun
#expression()

fx = expression(-x^2 + 6*x -6, "x")
D #도함수를 반환하는 함수
dfx = D(fx,"x") #fx를 x에 대해서 미분 하겠다는 말
eval(dfx)
f = function(x) eval(c(dfx))
f(2)
f = function(x) eval(c(dfx)[[1]]) #함수를 벡터로 형 변환 한 후, 1번을 뽑어
f(2)




## 복잡한 식의 미분
fx = expression(x^5 -1/x + cos(x)^x,'x')
fx
dfx = D(fx,"x")
print(dfx)

## 다변수 함수
fxyz = function(x,y,z) (x*y)^5 - 1/x^z +cos(x)^x

fxyz = expression((x*y)^5 - 1/x^z +cos(x)^x)
exp = deriv(fxyz,c("x","y","z"))#deriv()다변수 함수의 미분

f2 = function(x,y,z) eval(c(exp)) #도함수를 함수화
f2(1,1,1)#x,y,z에 숫자 대입 후 미분 값을 




###jeok bun
fx = function(x) 1/((x+1)*sqrt(x))
integrate(fx, lower = 0, upper = Inf)#0부터 무한구간의 적분
curve(fx,0,100)


#구분구적법
fx = function(x) x^4-10*x^3 + 15*x^2 -6*x + 10
curve(fx,0,1)

gubungujeok = function(from, to, N){
  sum = 0 #넓이는 0부터 시작할것
  h = (to-from)/N #밑변의 길이
  for(i in 1:N) sum = sum + h*fx(from + i*h)
  return(sum)
}
gubungujeok(0,1,10) #0에서 1까지 10으로 나눔눔

integrate(fx,0,1)
