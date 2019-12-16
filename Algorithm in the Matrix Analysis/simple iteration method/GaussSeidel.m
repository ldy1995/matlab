function x = GaussSeidel(A,b,niter,eps,x0)
%  Ax = b

%% par
[nx,ny] = size(A);
[nx1,ny1] = size(b);

if ny1 ~=1
    printf('b must be a column vector')
    return
end

if nx ~= nx1
    printf('row dimonsion betwee A and b must be same')
    return
end

if isempty(eps)
    eps = 1e-6;
end

if isempty(x0)
    x0 = zeros(ny,1);
end

%% iter
D = diag(diag(A));  %求A的对角矩阵
L = -tril(A,-1);    %求A的下三角矩阵,不带对角线
U = -triu(A,1);     %求A的上三角矩阵
G = (D-L)\U;
f = (D-L)\b;

x = G*x0+f;
n = 1;
while norm(x-x0)>=eps && n <= niter
    x0 = x;
    x = G*x0+f;
    n = n+1;
    
    if n >= 200
        printf('too many iters and maybe the function is non convergence ')
        return 
    end
end