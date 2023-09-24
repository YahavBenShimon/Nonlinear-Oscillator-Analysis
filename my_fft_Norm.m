function [Frq,Amp] = my_fft_Norm(signal,sample_frequency)
n_fft = length(signal);
Y = fft(signal,n_fft)./n_fft;
Amp = 2.*abs(Y((1:n_fft/2)));
Frq = sample_frequency*(0:n_fft/2-1)/n_fft;
end