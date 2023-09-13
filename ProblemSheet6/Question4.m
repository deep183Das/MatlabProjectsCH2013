%% ProblemSheet6 q4

h = 3600; % 1h = 3600s
%% a>
T1h = time(h*10);
error1h = 3600 - T1h;    % accumulated error after 1h

%% b>
T100h = time(h*100*10);
error100h = 360000 - T100h;    % accumulated error after 100h

%% c>
time_hour = [1:100];
error_val_array = [];
for i = 1:100
    error_val_array(i) = time_hour(i)*3600 - time(time_hour(i)*3600*10);
end
plot(time_hour,error_val_array,LineWidth=2);
xlabel('time in hour');
ylabel('accumulated error');

%% d>
vel = 274; % in m/s
% the distance the Patriot missile missed the Scud missile is :
d_miss = vel*error100h; % in meter

%% function to compute time with accumulated error value
function T = time(computation_val)
    t = 0;  
    for i = 1:computation_val
        c = 209715 / 2097152;
        t = t + 1*c;
    end
    T = t;
end
