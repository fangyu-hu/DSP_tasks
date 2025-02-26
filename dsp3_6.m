wp=0.4*pi;ws=0.6*pi;
Rp=0.5;As=45;
deltaw=ws-wp;
%%Hamming
N0 = ceil(6.6*pi/deltaw);
N = N0 + mod(N0+1,2)   %% 保证N为奇数
wc = (wp + ws)/2;
%% 得到理想单位脉冲响应 hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(wc*m)./(pi*m);
%% 得到N点的hamming窗
wdham = hamming(N)';
%% 得到脉冲响应
h = hd.*wdham;
%% 画出幅频特性(dB)，并检测As是否满足设计指标
[Rpp,Ass] = freqzn(h,1,wp/pi,ws/pi,Rp,As,'low')

%%Blackman
N0 = ceil(11*pi/deltaw);
N = N0 + mod(N0+1,2)   %% 保证N为奇数
wc = (wp + ws)/2;
%% 得到理想单位脉冲响应 hd
n = 0:N-1;
n0 = (N-1)/2;
m = n -n0 + eps;
hd = sin(wc*m)./(pi*m);
%% 得到N点的blackman窗
wdham = blackman(N)';
%% 得到脉冲响应
h = hd.*wdham;
%% 画出幅频特性(dB)，并检测As是否满足设计指标
[Rpp,Ass] = freqzn(h,1,wp/pi,ws/pi,Rp,As,'low')