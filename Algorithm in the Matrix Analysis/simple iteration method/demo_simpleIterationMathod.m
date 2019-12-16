% simple iteration method: Jacobi Sediel and SOR for 
%                        A*X = b
%% test coefficient matrix and b
% the true solve of A is [1.1,1.2,1.3]'
A = [10,-1,-2;-1,10,-2;-1,-1,5];
b = [7.2,8.3,4.2]';
X0 = zeros(max(size(b)),1);
par.maxIter = 100;
par.ems = 1e-8;

%% Jacobi iteration mathod
tic
[X_jac] = JacobiIter(A,b,par,X0);
toc

%% Seidel iteration method
tic
[X_sed] = SeidelIter(A,b,par,X0); % less iter than Jacobi
toc

%% SOR iteration method
par.w = 0.5;
tic
[X_SOR] = SORIter(A,b,par,X0);
toc
