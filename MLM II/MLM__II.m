close all;
clear;
clc;

%% PARSE
[num, text, raw] = xlsread('MLM_II_data.xlsx');
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
MECO = 226;
SECO = 652;

%% FIGURE 1
%  LAUNCH PROFILE TO MECO
figure(1);
subplot(2,2,1);
plot(time_mission(1:MECO), altitude_asl(1:MECO)./1000);
title('Altitude Over Time');
xlabel('Mission Time (s)');
ylabel('Altitude ASL (km)');

subplot(2,2,3);
plot(time_mission(1:MECO), distance_downrange(1:MECO)./1000);
title('Downrange Distance Over Time');
xlabel('Mission Time (s)');
ylabel('Downrange Distance (km)');

subplot(2,2,[2,4]);
plot(distance_downrange(1:MECO)./1000, altitude_asl(1:MECO)./1000);
title('Launch Profile');
xlabel('Downrange Distance (km)');
ylabel('Altitude ASL (km)');

saveas(1, 'GSO Relay Ship Launch Profile.png');

%% FIGURE 2
%  LAUNCH PROFILE TO SECO
figure(2);
subplot(2,2,1);
plot(time_mission(1:SECO,1), altitude_asl(1:SECO,1)./1000);
title('Altitude Over Time');
xlabel('Mission Time (s)');
ylabel('Altitude ASL (km)');

subplot(2,2,3);
plot(time_mission(1:SECO,1), distance_downrange(1:SECO,1)./1000);
title('Downrange Distance Over Time');
xlabel('Mission Time (s)');
ylabel('Downrange Distance (km)');

subplot(2,2,[2,4]);
plot(distance_downrange(1:SECO,1)./1000, altitude_asl(1:SECO,1)./1000);
title('Launch Profile');
xlabel('Downrange Distance (km)');
ylabel('Altitude ASL (km)');

saveas(1, 'GSO Relay Ship Launch Profile.png');