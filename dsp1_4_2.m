
fs = 400; % 采样频率
T = 1/fs; % 采样周期
% 信号定义
t = 0:T:1-T; % 时间序列
xa = cos(200*pi*t) + sin(100*pi*t) + cos(50*pi*t); % 连续信号
% 选择截取时间长度
Tp = 0.04; % 截取时间长度
N = fs * Tp; % 采样点数
% 矩形窗函数
w_rect = ones(1, N);
% Hamming窗函数
w_hamming = hamming(N);
% 截取并加窗
x_rect = xa(1:N) .* w_rect;
x_hamming = xa(1:N) .* w_hamming';
% 进行2048点DFT计算
X_rect = fft(x_rect, 2048);
X_hamming = fft(x_hamming, 2048);
% 频率坐标
f = (0:2047)*(fs/2048);
% 绘制频谱
figure;
subplot(2, 1, 1);
plot(f, abs(X_rect));
title('Tp=0.04*1矩形窗截断');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
subplot(2, 1, 2);
plot(f, abs(X_hamming));
title('Tp=0.04*1Hamming窗截断');
xlabel('Frequency (Hz)');
ylabel('Magnitude');