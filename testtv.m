clc
close all
clear

%% ����Ƶ�ļ�
[y0,fs] = audioread('new.wav');  %��ȡ
y=y0(:,1); %ȡ��һ�У���һ������

%% ������Ƶ�ź�ʱ����
m=length(y);
ts = 1/fs;
t=(0:(m-1)).*ts;
figure(1);
figure(1);
plot(t,y);title('�������Ƶ�ź�ʱ����');xlabel('t(s)');

%% ������Ƶ�ļ�
sound(y,fs);

%% ����Ƶ�źŽ���Ƶ�׷���

%% ֱ��DFT�任������������
Y1=fft(y);
Y=Y1(1:m/2);  %���ҶԳƣ�ȡ����
F=fs/m;
m0=m/2;       %���ҶԳƣ�ȡ����

ffr=(1:m/2).*F;
figure(2);
plot(ffr/1000,20*log10(abs(Y)));  %��λkHz�����Գ���һǧ
title('�������Ƶ�źŷ�����');xlabel('f(kHz)');ylabel('dB');

