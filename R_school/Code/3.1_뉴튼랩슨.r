newton_raphson = function(f, fp, init, tol = 1e-9, max = 100){ #tol은 0에 가깝지만 0은 아닌 값 #100번 돌리겠다
  iter = 0 #iteration 시작
  oldx = init #x0를 의미(뉴턴 랩슨의 초기값)
  x = oldx + 10 * tol # 밑에 while문을 돌리기 위해서 x - oldx가 tol보다 커야되는 조건
  
  #converge
  while (abs(x - oldx)>tol){ # 값이 수렴할 때 까지 run하겠다.
    iter = iter + 1 #다음 스템으로 움직이겠다는 증감
    
    if(iter>max){
      stop("there is no solution") # 100번 돌 때까지 수렴하지 않으면 출력하겠다
    }
    
    oldx = x # x업데이트
    x = x-f(x)/fp(x) # 뉴턴랩슨 구현
  }
  
  return(paste("solution is ",x))
}