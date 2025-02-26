N=10;
n=0:N-1;
k1=0:N-1;
w=2*pi*(0:2047)/2048;
Xw=0.5*[(1-exp(-1i*(w+pi/20)*10))./(1-exp(-1i*(w+pi/20)))+(1-exp(-1i*(w-pi/20)*10))./(1-exp(-1i*(w-pi/20)))];
xn=cos(n*pi/20);
X1k=fft (xn,N);%计算N1点的DFT
subplot(3,2,1);plot(w/pi,abs(Xw));xlabel('w/pi');title('连续频谱的幅度曲线');
subplot(3,2,3);plot(w/pi,angle(Xw));axis([0,2,-pi,pi]);line([0,2],[0,0]);xlabel('w/pi');title('连续频谱的相位曲线');
subplot(3,2,2);stem(k1,abs (X1k),'.');xlabel('k(w=2pik/N)');ylabel('|X(k)|');hold on;
plot(N/2*w/pi,abs(Xw));title('在频谱上叠加连续频谱的幅度曲线');%在频谱上叠加连续频谱的幅度曲线
subplot(3,2,4);stem(k1,angle(X1k),'.');axis([0,N,-pi,pi]);line([0,N],[0,0]);
xlabel('k (w=2pik/N)');ylabel('Arg[X1(k)]');hold on;
plot(N/2*w/pi,angle(Xw));title('在频谱上叠加连续频谱的相位曲线');