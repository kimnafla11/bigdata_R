#작성일 : 20210924
#작성자 : 나은이
#수업 : 빅데이터분석실무
#내용 : 함수

#1부터 n까지 합 함수
sum1toN = function(N){
  result = sum(1:N)
  return(result)
}
sum1toN(10)

#xyz값 제곱하고 서로 더한후 제곱근 취하기
#sqrt()제곱근 함수
sqrt_sum = function(x,y,z){
  result = sqrt(x^2+y^2+z^2)
  return(result)
}
sqrt_sum(4,55,14)


#함수 두개 같이 쓰기
zzamppong = function(x,y,z){
  result = sqrt(x^2+y^2+z^2)
  result2 = sum1toN(as.inteager(result))
  return(result2)
}
zzamppong(1,2,3)
