#작성일 : 20210924
#작성자 : 나은이
#수업 : 빅데이터분석실무
#내용 : 유클리디안거리로 마약범죄 소탕

s = c(1:10)
x = c(2,5,5,5,1,5,7,4,5,6)
y = c(0,4,1,2,8,9,5,2,4,1)
site = data.frame(site,x,y)

name = c("A","B","C")
manx = c(1,4,8)
many = c(5,7,1)
crime = c(5,1,3)
seller = data.frame(name,manx,many,crime)

site = as.matrix(site)
seller = as.matrix(seller)
seller[,2:4] = as.numeric(seller[,2:4])

distance = function(seller, site){
  dist_mat = matrix(1, nrow(site),1)
  
  for(i in 1:10){
    sex = as.numeric(seller[i,2:3]-site[i,2:3])
    sex%*%sex
    temp = sqrt(sex%*%sex)
    dist_mat[i,] = temp
  }
  return(dist_mat)
}
distance(seller,site)
