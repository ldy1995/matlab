function [ X_final, X_store ] = JacobiIter(A,b, par, varargin)
%% Jacobi iteration method to solve the linear equations
%                           A*X = b
% Jacobi structure is:
%                     X_k+1 = B*X_k + g
%                   where B = D^(-1)*(D-A)
% input:    
%       A: coefficent matrix
%       b: right side item of the linear equations
%       par: maxIter is the max number of the iteration
%            ems is the upper bound of error between the adjacent iterative
%            estimated values
%       X0: if X0 is not inputed by the user, zero matrix is defaulted
% output:
%       X_final: the final estimated value 
%       X_store: each estimated value in the iterative process
%
%  By Danyang Li      2018/12/3
%% para
maxIter = par.maxIter;
ems = par.ems;

if isempty(maxIter)
    maxIter = 100;
end

if isempty(ems)
    ems = 1e-6;
end

if isempty(varargin)
    X0 = zeros(size(A,1),1);
else
    X0 = varargin{:};
end

%% calculate B and g
A_diag = diag(A);
D = diag(A_diag);

B = D^(-1)*(D-A);
g = D^(-1)*b;

%% main iterative loop
X_k = X0;
X_store = zeros(max(size(X0)),maxIter+1);
X_store(:,1) = X0;
printf('Jacobi iteration method...')
for iter = 1:maxIter
    X_kk = B * X_k + g;
   
    if sum(abs(X_k - X_kk)) <= ems
        printf(['Iteration process is terminated early,\nfor error between '...
                'adjacent iterations is satisfied by error :',num2str(ems)])
        printf(['and the actual iteration number is ',num2str(iter)])
        break
    end
    
    X_k  = X_kk;
    X_store(:,iter+1) = X_kk;
    
end

X_final = X_k;
if iter == maxIter
    printf(['Iteration process has finished by max iteration number: ',num2str(maxIter)])
end


