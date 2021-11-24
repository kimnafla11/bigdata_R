#install.packages("autoencoder")
library(autoencoder)

df = read.csv("c:/eeg_tr.txt")
names(df)
plot(df$c1, type='o', col='red') #센서값 시각화
fix(df)#데이터 보기

mat = as.matrix(df[,3:ncol(df)]) #연속형 변수들만 추출
par(mfrow=c(3,1)) #plot 여러개 하려고ㅇㅇ

#변수별 시계열 plot 찍어보기
for (i in 1:ncol(mat)){ #1번부터 mat변수 수 만큼 반복
  plot(mat[,i], type='o')
}


## pca ##
pc = princomp(mat) #R패키지를 활용하여 pca수행
summary(pc)
#결과해석, 여러가지 센서들이 상관관계를 가지면서 영향을 끼친다.

par(mfrow=c(1,1))
biplot(pc)

sc = pc$scores[,4:18] #pca를 하면서 손실되는 정보(이걸 갖다가 이상감지에 활용할 수 있다)
recon_error = rowSums(sqrt(sc^2)) #에러들을 다 더해줌
plot(recon_error) 
pred = predict(pc,mat)
plot(sqrt(rowSums(pred[,4:18]^2)))

## autoencoder
nl=3 ## number of layers (default is 3: input, hidden, output)
unit.type = "logistic" ## specify the network unit type, i.e., the unit's
## activation function ("logistic" or "tanh") #활성함수는 로지스틱 함수 쓰겠다.

N.input = 15 ## number of units (neurons) in the input layer (one unit per pixel)
N.hidden = 5 ## number of units in the hidden layer
lambda = 0.0002 ## weight decay parameter
beta = 6 ## weight of sparsity penalty term
rho = 0.01 ## desired sparsity parameter 
epsilon <- 0.001 ## a small parameter for initialization of weights
## as small gaussian random numbers sampled from N(0,epsilon^2)
max.iterations = 100 ## number of iterations in optimizer
#하이퍼 파라미터 (이것도 최적화 해야하지만 디폴트로)

fit <- autoencode(X.train=mat,nl=nl,N.hidden=N.hidden,
                  unit.type=unit.type,lambda=lambda,beta=beta,rho=rho,epsilon=epsilon,
                  optim.method="BFGS",max.iterations=max.iterations,
                  rescale.flag=TRUE,rescaling.offset=0.001)#오토 인코더 학습

attributes(fit)
pred= predict(fit,mat) #원래데이터와 오토인코더모델갖다가 예측
recon = pred$X.output #아웃풋 노드(나자신을 요약한 아웃풋데이터)
dim(recon)

recon_error = rowSums(mat - recon) #리컨스트럭션 에러, 나와 나를 요약한 데이터의 차이(에러)
plot(recon_error)

