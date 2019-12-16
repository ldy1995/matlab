function [ X_final, X_store ] = SeidelIter(A,b, par, varargin)
%% Seidel iteration method to solve the linear equations
%                           A*X = b
% Seidel structure is:
%             X_kk = (I - L)^(-1) * U * X_k + (I - L)^(-1) * g
%          where L and U is the low tri- and up tri- matriax of B
%                     and B = D^(-1)*(D-A)
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

%% par
maxIter = par.maxIter;
ems     = par.ems;

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
%% L and U of B
A_diag = diag(A);
D = diag(A_diag);
B = D^(-1) * ( D - A );
g = D^(-1) * b;

L = tril(B);
U = triu(B);
I = eye(max(size(A_diag)));

%% main loop
X_k = X0;
X_store = zeros(max(size(X0)),maxIter+1);
X_store(:,1) = X0;
printf('Seidel iteration method...')
for iter = 1:maxIter
    X_kk = (I - L)^(-1) * U * X_k + (I - L)^(-1) * g;
   
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


end

