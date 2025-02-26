
fs = 400; % 采样频率
T = 1/fs; % 采样周期
% 信号定义
t = 0:T:1-T; % 时间序列
xa = cos(200*pi*t) + sin(100*pi*t) + cos(50*pi*t); % 连续信号
% 计算DFT
X = fft(xa);
% 频率坐标
N = length(X);
f = (0:N-1)*(fs/N);
% 绘制幅度谱
figure;
plot(f, abs(X));
title('Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');