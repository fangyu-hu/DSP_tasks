clc
close all
clear

%% 读音频文件
[y0,fs] = audioread('new.wav');  %读取
y=y0(:,1); %取第一列，即一个声道

%% 画出音频信号时域波形
m=length(y);
ts = 1/fs;
t=(0:(m-1)).*ts;
figure(1);
figure(1);
plot(t,y);title('处理后音频信号时域波形');xlabel('t(s)');

%% 播放音频文件
sound(y,fs);

%% 对音频信号进行频谱分析

%% 直接DFT变换，画出幅度谱
Y1=fft(y);
Y=Y1(1:m/2);  %左右对称，取左半边
F=fs/m;
m0=m/2;       %左右对称，取左半边

ffr=(1:m/2).*F;
figure(2);
plot(ffr/1000,20*log10(abs(Y)));  %单位kHz，所以除以一千
title('处理后音频信号幅度谱');xlabel('f(kHz)');ylabel('dB');

