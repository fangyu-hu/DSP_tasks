n1=0:14;n2=0:19;
N=length(n1)+length(n2)-1;
xn=sin(0.4*n1);
hn=0.9.^n2;
Xk=fft(xn,N); %计算N点的DFT[x(n)]
Hk=fft(hn,N); %计算N点的DFT[h(n)]
Yk=Xk.*Hk;    %DFT[x(n)].*DFT[h(n)]
y=ifft(Yk,N);