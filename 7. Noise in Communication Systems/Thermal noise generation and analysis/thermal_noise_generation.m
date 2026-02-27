B = 1000000;
R = 100;
T = 300;
n_samples = 10000;

time = 0 : 1/B : (n_samples-1)/B;
thermal_noise = sqrt(4 * 1.38e-23 * T * R * B) * randn(1, n_samples);

% Time domain plot
figure;
plot(time, thermal_noise);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Thermal Noise - Time Domain');

% PSD plot
figure;
[psd, freq] = pwelch(thermal_noise, [], [], [], B);
semilogx(freq, 10*log10(psd));
xlabel('Frequency (Hz)');
ylabel('PSD (dB/Hz)');
title('Power Spectral Density of Thermal Noise');
