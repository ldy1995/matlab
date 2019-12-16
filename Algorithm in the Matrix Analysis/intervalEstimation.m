% Interval Estimation 

%% interval estimation for the u of one population whose var is known

% x = [14.6, 15.1, 14.9, 14.8, 15.2, 15.1];
x = [2.14,2.10,2.13,2.15,2.13,2.12,2.13,2.10,...
      2.15,2.12,2.14,2.10,2.13,2.11,2.14,2.11];

conf_deg = 0.90;
free_deg = max(size(x(:)));
a        = 1 - conf_deg;
v        = 0.01^2; % variance (^2)


low_bound = mean(x) - norminv(1-a/2) * sqrt(v/free_deg);
up_bound  = mean(x) + norminv(1-a/2) * sqrt(v/free_deg);

%% interval estimation for the u of one population whose var is unknown

% x = [99.3,98.7,100.5,101.2,98.3,99.7,99.5,102.1,100.5];

conf_deg = 0.90;
free_deg = max(size(x(:)));
a        = 1 - conf_deg;

low_bound = mean(x) - tinv(1-a/2, free_deg-1) * sqrt(var(x)/free_deg);
up_bound  = mean(x) + tinv(1-a/2, free_deg-1) * sqrt(var(x)/free_deg);

%% interval estimation for the var of one population whose u is unknown

x = [12.15,12.12,12.01,12.08,12.09,12.16,12.06,12.13,...
     12.07,12.11,12.08,12.01,12.03,12.01,12.03,12.06];

conf_deg = 0.95;
free_deg = max(size(x(:)));
a        = 1 - conf_deg;

low_bound = (free_deg-1)*var(x) / chi2inv(1-a/2,free_deg-1);
up_bound  = (free_deg-1)*var(x) / chi2inv(1-(1-a/2), free_deg-1);

%% interval estimation for the u-sub of two population whose var are known

A = [6.2,5.7,6.5,6.0,6.3,5.8,5.7,6.0,6.0,5.8,6.0];
B = [5.6,5.9,5.6,5.7,5.8,6.0,5.5,5.7,5.5];

conf_deg  = 0.95;
a         = 1-conf_deg;
free_degA = max(size(A(:)));
free_degB = max(size(B(:)));

low_bound = mean(A)-mean(B) - norminv(1-a/2) * sqrt( var(A(:))/free_degA + var(B(:))/free_degB );
up_bound  = mean(A)-mean(B) + norminv(1-a/2) * sqrt( var(A(:))/free_degA + var(B(:))/free_degB );


%% interval estimation for the u-sub of two polulations whose u are unknown while v1 = v2 = v

A = [2.066, 2.063, 2.068, 2.060, 2.067];
B = [2.058, 2.057, 2.063, 2.059, 2.060];

% A = [6.2,5.7,6.5,6.0,6.3,5.8,5.7,6.0,6.0,5.8,6.0]';
% B = [5.6,5.9,5.6,5.7,5.8,6.0,5.5,5.7,5.5]';

% A = [86,87,56,93,84,93,75,79]';
% B = [79,58,91,77,82,74,80,66]';

% par
VA        = max(size(A)); 
VB        = max(size(B));
V         = VA + VB -2;
conf_deg  = 0.90; % estimation degree
a         = 1 - conf_deg; 

u_a = mean(A(:));
u_b = mean(B(:));

low_bound = (u_a-u_b) - tinv(1-a/2, V) * sqrt((VA-1)*var(A)+(VB-1)*var(B)) * sqrt( (VA+VB)/( VA*VB*V ) );
up_bound  = (u_a-u_b) + tinv(1-a/2, V) * sqrt((VA-1)*var(A)+(VB-1)*var(B)) * sqrt( (VA+VB)/( VA*VB*V ) );

%%  interval estimation for the var-ratio of two populations whose u are unknown

A = [2.066, 2.063, 2.068, 2.060, 2.067]';
B = [2.058, 2.057, 2.063, 2.059, 2.060]';

% A = [20.5,18.8,19.8,20.9,21.5,19.5,21.0,21.2];
% B = [17.7,20.3,20.0,18.8,19.0,20.1,20.2,19.1];

% par
free_degA = max(size(A)) - 1; 
free_degB = max(size(B)) - 1; 
conf_deg  = 0.90; % estimation degree
a         = 1 - conf_deg; 

S_va = var(A,0); % correct ver
S_vb = var(B,0);

% finv cals the lower quantile of a
% therefore the upper quantile of a is finv(1-a);
low_bound = finv(1-(1-a/2),free_degB,free_degA) * S_va/S_vb;
up_bound  = finv(  1-(a/2),free_degB,free_degA) * S_va/S_vb;
