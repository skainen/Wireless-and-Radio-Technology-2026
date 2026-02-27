% Parameters
fs = 1000;           % Sampling frequency in Hz
t = 0:1/fs:1;        % Time vector
f_signal = 5;        % Signal frequency in Hz
amplitude = 1;       % Amplitude

% Generate sinusoidal signal
signal = amplitude * sin(2 * pi * f_signal * t);

% Add Gaussian white noise
noise_power = 0.5;
noisy_signal = signal + noise_power * randn(size(t));

% Plot original and noisy signals
figure;
subplot(3,1,1);
plot(t, signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Sinusoidal Signal');

subplot(3,1,2);
plot(t, noisy_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Noisy Signal');

% Low-pass Butterworth filter
cutoff_frequency = 10;         % Cutoff frequency in Hz
filter_order = 4;              % Filter order
[b, a] = butter(filter_order, cutoff_frequency / (fs/2), 'low');
filtered_signal = filtfilt(b, a, noisy_signal);

% Plot filtered signal
subplot(3,1,3);
plot(t, filtered_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered Signal');
