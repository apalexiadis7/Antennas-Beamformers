%% Simulation parameters
lambda = 1550e-09;
c = 3e8;
freq = c/lambda;
T = 1/freq;
omega = 2*pi*freq;
k = 2*pi/lambda;
az = 8;
% Number of array elements
d=lambda/2;
dtheta=(2*pi)/360;
theta = 0:dtheta:(2*pi);
%% Animate
phase1=zeros(1,8);
phase2=zeros(1,8);
phase3=zeros(1,8);
phase4=zeros(1,8);
% phases for the three angles, according to the formula
for i=1:8
phase2(i)=-(i-1)*pi*sind(30);
phase3(i)=-(i-1)*pi*sind(60);
phase4(i)=-(i-1)*pi*sind(90);
end
% merging all the phases of the phasors into one matrix
phase=zeros(4,8);
phase=[phase1;phase2;phase3;phase4];
af1=zeros(361);
af2=zeros(361);
af3=zeros(361);
af4=zeros(361);
% calculation of the array factor, with a sensitivity of 1 degree
for ii=1:361
for j=1:8
af1(ii)=af1(ii)+exp(1i*phase1(j))*exp(1i*(j-1)*k*d*sin(theta(ii)));
af2(ii)=af2(ii)+exp(1i*phase2(j))*exp(1i*(j-1)*k*d*sin(theta(ii)));
af3(ii)=af3(ii)+exp(1i*phase3(j))*exp(1i*(j-1)*k*d*sin(theta(ii)));
af4(ii)=af4(ii)+exp(1i*phase4(j))*exp(1i*(j-1)*k*d*sin(theta(ii)));
end
end
% plotting the results
figure(1);
polarplot(theta,abs(af1));
figure(2);
polarplot(theta,abs(af2));
figure(3);
polarplot(theta,abs(af3));
figure(4);
polarplot(theta,abs(af4));
