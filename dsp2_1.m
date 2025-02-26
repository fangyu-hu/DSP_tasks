wp = (1.5/10)*2*pi; 
ws = (3/10)*2*pi;
Rp = 3;
As = 12;
%% 将数字滤波器设计指标转换为模拟滤波器的设计指标
fs=10000;
T = 1/fs;
omegaP = wp/T;
omegaS = ws/T;
%% 得到模拟滤波器的阶次
[N,omega] = buttord (omegaP, omegaS, Rp, As, 's')
%% 得到模拟滤波器的系统函数
[b,a] = butter (N,omega,'s')
%% 使用冲激响应不变法将模拟滤波器转换为数字滤波器
[bz,az] = impinvar(b,a,fs)
%% 画出所设计数字滤波器的幅频特性，并检测Rp，As是否满足设计指标
[Rpp,Ass] = freqzn(bz, az, wp/pi, ws/pi, Rp, As, 'low')  %%（自编函数）