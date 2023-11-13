%setup
clc;
close all;
clear all;
format long;


Fs = 9000;
Ts = 1/Fs;
t = -5 : Ts :5;
A1=1; A2=5; A3=2; A4=3; 
lungime1=1;
lungime2=0.4;
lungime3=0.6;
lungime4=0.8;
dreptunghi1 = A1* rectpuls(t, lungime1);
dreptunghi2 = A2* rectpuls(t, lungime2);
dreptunghi3 = A3* rectpuls(t, lungime3);
dreptunghi4 = A4* rectpuls(t, lungime4);

%afisare

subplot(2, 2, 1);
plot(t, dreptunghi1, 'r')
grid;

subplot(2,2,2);
plot(t,dreptunghi2, 'g')
grid;

subplot(2,2,3);
plot(t,dreptunghi3, 'y')
grid;
subplot(2,2,4);
plot(t,dreptunghi4, 'b')
grid;

%fac spectrele cu transformata fourier
% se va calcula transformata Fourier in mai multe puncte in frecventa decat nr de puncte din timp
Nfft1 = length(dreptunghi1)*10;
pas = Fs/Nfft1;
F1 = -Fs/2 : pas : Fs/2 - pas;
Y1 = fft(dreptunghi1, Nfft1);
Y1 = Y1/max(Y1)*1; %normare

Nfft1 = length(dreptunghi2)*10;
pas = Fs/Nfft1;
F2 = -Fs/2 : pas : Fs/2 - pas;
Y2 = fft(dreptunghi2, Nfft1);
Y2 = Y2/max(Y2)*5;

Nfft1 = length(dreptunghi3)*10;
pas = Fs/Nfft1;
F3 = -Fs/2 : pas : Fs/2 - pas;
Y3 = fft(dreptunghi3, Nfft1);
Y3 = Y3/max(Y3)*2;

Nfft1 = length(dreptunghi4)*10;
pas = Fs/Nfft1;
F4 = -Fs/2 : pas : Fs/2 - pas;
Y4 = fft(dreptunghi4, Nfft1);
Y4 = Y4/max(Y4)*3;

figure
subplot(2,2,1)
plot(F1, abs(fftshift(Y1))) % spectrul apare continuu - transformata Fourier
grid

subplot(2,2,2)
plot(F2, abs(fftshift(Y2))) % spectrul apare continuu - transformata Fourier
grid

subplot(2,2,3)
plot(F3, abs(fftshift(Y3))) % spectrul apare continuu - transformata Fourier
grid

subplot(2,2,4)
plot(F4, abs(fftshift(Y4))) % spectrul apare continuu - transformata Fourier
grid
