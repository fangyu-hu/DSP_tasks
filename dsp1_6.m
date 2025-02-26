M = 40;
n = 0:M;
n1=0:63;
n2=0:31;
xa = 0:floor(M/2);
xb = (ceil(M/2)-1):-1:0;
xn = [xa, xb];
Xk=fft(xn,64);
X1k=Xk(1:2:64);
x1n=ifft(X1k,32);
x2n = repmat(x1n, 1, 2);
subplot(3,2,1)
stem(n, xn);
ylabel('x(n)');
title('40点的三角波序列x(n)');
subplot(3,2,2)
stem(n1, abs(Xk));
ylabel('|X(k)|');
title('64点的DFT[x(n)]');
subplot(3,2,3)
stem(n2, abs(x1n));
ylabel('x1(n)');
title('32点的IDFT[X2(k)]=x1(n)');
subplot(3,2,4)
stem(n2, abs(X1k));
ylabel('隔点抽取X(k)得到X1(k)'); 
subplot(3,2,5)
stem(n1, abs(x2n));
ylabel('x1(n)的周期延拓序列');