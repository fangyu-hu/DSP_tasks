wp=0.1*pi;ws=0.4*pi;
Rp=0.3;As=50;
deltaw=ws-wp;
N=51;
% N=51;
wc=0.4*pi;
n=0:N-1;
n0=(N-1)/2;
m=n-n0+eps;
hd=sin(wc*m)./(pi*m)
wdham=blackman(N)';
h=hd.*wdham;
[Rp,Ass]=freqzn(h,1,wp/pi,ws/pi,Rp,As,'low')