close all;
clear;
clc;

[num, text, raw] = xlsread('GSRS I_data.csv');
time_mission = num(:,2);
altitude_asl = num(:,3);
apoapsis = num(:,7);
periapsis = num(:,8);
periapsis(periapsis<0) = 0;
distance_downrange = num(:,19);
throttle = num(:,20);
gee = num(:,15);
velocity_orbital = num(:,10);
velocity_surface = num(:,11);
density_atmospheric = num(:,18);

%% FIGURE 1
figure(1);
hold on;
plot(time_mission, altitude_asl);
plot(time_mission, apoapsis);
plot(time_mission, periapsis);
xlabel('Mission Time (s)');
ylabel('Altitude Above Sea Level (m)');
legend('Altitude', 'Apoapsis', 'Periapsis', 'Location', 'northwest');

%% FIGURE 2
figure(2);
subplot(2,2,1);
plot(time_mission, altitude_asl);
xlabel('Mission Time (s)');
ylabel('Altitude Above Sea Level (m)');
title('Altitude Over Time');

subplot(2,2,3);
plot(time_mission, distance_downrange);
xlabel('Mission Time (s)');
ylabel('Downrange Distance (m)');
title('Downrange Distance Over Time');

subplot(2,2,[2,4]);
plot(distance_downrange, altitude_asl);
xlabel('Downrange Distance (m)');
ylabel('Altitude Above Sea Level (m)');
title('Launch Profile');

%% FIGURE 3
figure(3)
subplot(1,2,1);
bar(time_mission, throttle);
xlabel('Mission Time (s)');
ylabel('Thrust Percent');

subplot(1,2,2);
bar(time_mission, gee);
xlabel('Mission Time (s)');
ylabel('Gee Force (gees)');

%% FIGURE 4
figure(4);
hold on;
plot(time_mission, velocity_orbital);
plot(time_mission, velocity_surface);
xlabel('Mission Time (s), Velocity (m/s)');
legend('Orbital Velocity', 'Surface Velocity', 'Location', 'northwest');

%% FIGURE 5
figure(5);
index_missiontime_MECO = 279;
plot(distance_downrange(1:index_missiontime_MECO+1), altitude_asl(1:index_missiontime_MECO+1));
xlabel('Downrange Distance (m)');
ylabel('Altitude Above Sea Level (m)');
%daspect([1 1 1]);
title('Launch Profile');

%% FIGURE 6
figure(6);
subplot(1,2,1);
index_missiontime_MECO = 279;
plot(distance_downrange(1:index_missiontime_MECO+1), altitude_asl(1:index_missiontime_MECO+1));
xlabel('Downrange Distance (m)');
ylabel('Altitude Above Sea Level (m)');
%daspect([1 1 1]);
title('Launch Profile');

subplot(1,2,2);
plot(gee(1:index_missiontime_MECO-4), altitude_asl(1:index_missiontime_MECO-4));
xlabel('Acceleration (g)');
ylabel('Altitude Above Sea Level (m)');

%% FIGURE 7
figure(7)
% calculate max aerodynamic pressure
q = 0.5 .* density_atmospheric .* velocity_surface .* velocity_surface;
[index_maxQ, maxQ] = max(q);
% plot
plot(time_mission, q);