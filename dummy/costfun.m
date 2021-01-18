function cost = costfun(t)
x= 1:10:360;
y= sind(x);

net = fitnet(t(1));
net.divideParam.trainRatio=0.6;
net.divideParam.valRatio=0.2;
net.divideParam.testRatio=0.2;
[net, ~] = train(net,x,y)
x1= 10:17:360;
ypred =net(x1);

cost=  sqrt(sum((ypred-sind(x1)).^2))
end
