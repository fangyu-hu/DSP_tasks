wp = (2.5/10)*2*pi
ws = (3.5/10)*2*pi
Rp = 2;
As = 15;
%% 将数字滤波器设计指标转换为模拟滤波器的设计指标
%% 当使用双线性变化法时要预畸变
fs=10000;
T = 1/fs;
omegaP = (2/T)*tan(wp/2)
omegaS = (2/T)*tan(ws/2)
%% 得到模拟滤波器的阶次
[N,omega] = buttord (omegaP,omegaS,Rp,As,'s')
%% 设计模拟滤波器
[b,a] = butter(N,omega,'s')
%% 使用双线性变换法将模拟滤波器转换为数字滤波器
[bz,az] = bilinear(b,a,1/T)
%% 画出所设计数字滤波器的幅频特性，并检测 Rp，As 是否满足设计指标
[Rpp,Ass] = freqzn(bz, az, wp/pi, ws/pi, Rp, As, 'low') %%（自编函数）