% Parameters
fs = 1000;
t = 0:1/fs:1;
f_c = 50;
SNR_values = [10, 5, 0, -5];


% Generate binary message signal
message_signal = randi([0 1], 1, length(t));

% ASK Modulation
carrier = cos(2 * pi * f_c * t);
ask_signal = message_signal .* carrier;

% Plot original modulated signal
figure;
subplot(5,1,1);
plot(t, ask_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original ASK Modulated Signal');
xlim([0 0.2]);

% Process each SNR value
for i = 1:length(SNR_values)
    % Add gaussian white noise
    noisy_signal = awgn(ask_signal, SNR_values(i), 'measured');

    % Demodulation: multiply by carrier then low-pass filter
    demodulated = noisy_signal .* carrier;
    [b, a] = butter(4, (f_c / 2) / (fs / 2), 'low');
    demodulated_filtered = filtfilt(b, a, demodulated);

    % Decision threshold
    threshold = mean(demodulated_filtered);
    recovered_signal = demodulated_filtered > threshold;

    % Plot received and demodulated signals
    subplot(5,1,i+1);
    plot(t, noisy_signal, 'Color', [0.7 0.7 0.7]); hold on;
    plot(t, recovered_signal, 'r', 'LineWidth', 1.5);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title(['SNR = ' num2str(SNR_values(i)) ' dB  |  BER = ' ...
           num2str(mean(recovered_signal ~= message_signal), '%.4f')]);
    legend('Received', 'Recovered');
    xlim([0 0.2]);
    hold off;
end

sgtitle('ASK Modulation with Varying SNR');
