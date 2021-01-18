
x= 1:10:360;
y= sind(x);
net = fitnet(10);
net.divideParam.trainRatio=0.6;
net.divideParam.valRatio=0.2;
net.divideParam.testRatio=0.2;
[net, ~] = train(net,x,y)
x1= 10:17:360;
ypred =net(x1)
