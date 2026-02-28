clc;
close all;
clear all;

tmin = input('The lower bound of theta in degree= ');
tmax = input('The upper bound of theta in degree= ');
pmin = input('The lower bound of phi in degree= ');
pmax = input('The upper bound of phi in degree= ');

theta = (tmin:tmax) * pi/180;
phi   = (pmin:pmax) * pi/180;

dth = theta(2) - theta(1);
dph = phi(2)   - phi(1);

[THETA, PHI] = meshgrid(theta, phi);

x = input('The field pattern : E(THETA,PHI)= ', 's');
x = eval(x);   % e.g. user types: cos(THETA)

v = input('The power pattern: P(THETA,PHI)= ', 's');
% e.g. user types: cos(THETA).^2

% Beam solid angle: Omega_A = ∫∫ Pn(θ,φ) sin(θ) dθ dφ
% where Pn = normalized power pattern = |E|^2
Pn   = x.^2;
Prad = sum(sum(Pn .* sin(THETA))) * dth * dph;

fprintf('\n Input Parameters: \n--------------------');
fprintf('\n Theta = %2.0f', tmin);
fprintf(' : %2.0f', dth*180/pi);
fprintf(' : %2.0f', tmax);
fprintf('\n Phi   = %2.0f', pmin);
fprintf(' : %2.0f', dph*180/pi);
fprintf(' : %2.0f', pmax);
fprintf('\n POWER PATTERN : %s', v);
fprintf('\n\n Output Parameters: \n--------------------');
fprintf('\n BEAM AREA (steradians) = %3.2f\n', Prad);

if tmax == 90
    fprintf(' (Upper hemisphere: theta = 0 to 90 deg)\n');
end
