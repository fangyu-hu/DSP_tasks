clc
close all
clear

%% 读音频文件
[y0,fs] = audioread('wdzg_bad2017.wav');  %读取
y=y0(:,1);                      %取第一列，即一个声道

%% 画出音频信号时 域波形
m=length(y);
ts = 1/fs;
t=(0:(m-1)).*ts;
figure(1);
plot(t,y);title('音频信号时域波形');xlabel('t(s)');

%% 播放音频文件
sound(y0,fs);

%% 对音频信号进行频谱分析

%% 直接DFT变换，画出幅度谱
Y1=fft(y);
Y=Y1(1:ceil(m/2));  %左右对称，取左半边
F=fs/m;
m0=m/2;       %左右对称，取左半边
ffr=(1:ceil(m0)).*F;
figure(2);
plot(ffr/1000,20*log10(abs(Y)));  %单位kHz，所以除以一千
title('音频信号幅度谱');xlabel('f(kHz)');ylabel('dB');

%% 分帧，加窗，DFT
Yfr = zeros(ceil(m/512-1),1024);   
n = hanning(1024);                 % frame blocking 分帧
for i= 1:m/512-1
    j=(i-1)*512+1;
    yfr = y(j:j+1023);             %当前要处理的一帧
    z = n .* yfr;
    Yfr(i,:) = 20*log10(abs(fft(z,1024)));%幅度存到矩阵里
end
tfr = (0:m/512-2).*512/fs;              %坐标
ffr = fs.*(0:512)/1024;

figure(3);
imagesc(tfr,ffr/1000,Yfr(:,1:512+1)');title('音频信号的频谱图2');xlabel('t(s)');ylabel('f(kHz)');colormap(gray);
axis xy;

%% 对实验中给出的有“毛刺”的音频信号进行低通滤波
omegaP = 11000;
omegaS = 18000;
Rp = 1;
As = 40;
[N,Wn] = buttord(omegaP/(fs),omegaS/(fs),Rp,As);
[b,a] = butter(N,Wn);
newtv = zeros(m,2);
newtv(:,1) = filter(b,a,y(:,1));
newtv(:,2) = newtv(:,1);
y=newtv(:,1);
Yfr = zeros(ceil(m/512-1),1024);   %(m/512-1)向上取整行1024列0矩阵，一秒一行，邻帧有512重叠
n = hanning(1024);                 % frame blocking 分帧
for i=1:m/512-1
    j=(i-1)*512+1;                 %用i和j算出每一帧的起点
    yfr = y(j:j+1023);             %当前要处理的一帧
    z = n .* yfr;
    Yfr(i,:) = 20*log10(abs(fft(z,1024)));%幅度存到矩阵里
end
tfr = (0:m/512-2).*512;            
ffr = (0:512)/1024;

figure(4);
imagesc(tfr,ffr/1000,Yfr(:,1:512+1)');title('处理后音频信号的频谱图2');xlabel('t(s)');ylabel('f(kHz)');colormap(gray);
axis xy;

audiowrite('new.wav',newtv,fs);
