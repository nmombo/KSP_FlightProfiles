close all;
clear;
clc;

%% PARSE
[num, text, raw] = xlsread('GSO Relay Ship_data.xlsx');
time_mission = num(:,2);
altitude_asl = num(:,3);
apoapsis = num(:,7);
periapsis = num(:,8);
periapsis(periapsis<0) = 0;
velocity_orbital = num(:,10);
velocity_surface = num(:,11);
velocity_horizontal = num(:,13);
velocity_vertical = num(:,12);
thrust = num(:,14);
gee = num(:,15);
density_atmospheric = num(:,18);
distance_downrange = num(:,19);
throttle = num(:,20);
angle_progradetohorizontal = atan(velocity_vertical ./ velocity_horizontal);
pressure_aerodynamic = 0.5 .* density_atmospheric .* velocity_surface.^2;

%% FIGURE 1
%  LAUNCH PROFILE
figure(1);
subplot(2,2,1);
plot(time_mission, altitude_asl);
title('Altitude Over Time');
xlabel('Mission Time (s)');
ylabel('Altitude ASL (m)');

subplot(2,2,3);
plot(time_mission, distance_downrange);
title('Downrange Distance Over Time');
xlabel('Mission Time (s)');
ylabel('Downrange Distance (m)');

subplot(2,2,[2,4]);
plot(distance_downrange, altitude_asl);
title('Launch Profile');
xlabel('Downrange Distance (m)');
ylabel('Altitude ASL (m)');

saveas(1, 'GSO Relay Ship Launch Profile.png');