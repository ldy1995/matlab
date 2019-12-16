% point Estimation

%% Moment Estimation

% x = [1.3, 0.6, 1.7, 2.2, 0.3, 1.1]';
x = [14.7,15.1,14.8,15.0,15.2,14.6];


% 1 order moment of origin
A1 = mean(x);

% 2 order moment of origin

A2 = mean(x.^2);

% estimation of u and var
es_u = A1;
es_v = A2 - A1^2;


