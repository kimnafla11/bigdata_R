secant = function(f, init, tol = 1e-9, max = 100){
  i = 0
  oldx = init
  oldfx = f(init) # 초기 값에 따른 y값
  x = oldx + 10 * tol # 밑에 while문을 돌리기 위한 식
  
  #convergence
  while(abs(x-oldx)>tol){
    i = i+1
    
    if(i>max) stop("there is no solution")
    fx = f(x) # y를 업데이트
    newx = x-f(x)*((x-oldx)/(fx-oldfx)) #★ secant, 할선의 방정식(y=0을 지나는 x를 찾음)
    oldx = x # 기존 oldx는 x로 업데이트
    oldfx = fx # x는 newx로 업데이트
    x = newx
    cat("iteration",i,"value of x is :",x,"\n")
  }
  return(x)
}