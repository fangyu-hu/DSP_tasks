n=0:99;
xn=cos(0.48*pi*n)+cos(0.52*pi*n);
n1=0:9;
y1=xn(1:10);
subplot(3,2,1);stem(n1,y1);Y1=fft(y1,10);magY1=abs(Y1);k1=0:1:9;N=10;w1=(2*pi/N)*k1;
subplot(3,2,2);stem(w1/pi,magY1);K=500;k=0:1:K;w=2*pi*k/K;
X=y1*exp(-1j*n1'*w);magX=abs(X);hold on;
%plot(w/pi,magX);
hold off;

n2=0:99;
xn1=cos(0.48*pi*n2)+cos(0.52*pi*n2);n3=0:99;
y2=[xn1(1:10),zeros(1,90)];
subplot(3,2,3);stem(n3,y2);Y2=fft(y2,100);magY2=abs(Y2);k2=0:1:99;N1=100;w2=(2*pi/N1)*k2;
subplot(3,2,4);stem(w2/pi,magY2);K1=500;k3=0:1:K1;w3=2*pi*k3/K1;
X1=y2*exp(-1j*n3'*w3);magX1=abs(X1);hold on;
%plot(w/pi,magX); 
hold off;

n4=0:99;
xn2=cos(0.48*pi*n4)+cos(0.52*pi*n4);
subplot(3,2,5);stem(n4,xn2);Xk=fft(xn2,100);magXk=abs(Xk);k4=0:1:99;N2=100;w4=(2*pi/N2)*k4;
subplot(3,2,6);stem(w4/pi,magXk);K2=500;k5=0:1:K2;w5=2*pi*k5/K2;
X2=xn2*exp(-1j*n4'*w5);magX2=abs(X2);hold on;
%plot(w/pi,magX);
hold off;