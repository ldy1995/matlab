x=-1:0.01:1;
n=6;
T=ones(n,size(x,2));
for i=2:n
    T(i,:)=Chebyshev1(x,i);
end
figure
plot(x,x)
hold on
num_name=cell(1,n);
for i=1:n
   plot(x,T(i,:))
end
legend('n=1','n=2','n=3','n=4','n=5','n=6')
hold off