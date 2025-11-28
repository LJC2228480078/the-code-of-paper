function y=fuzzynumberplot(x1,a,b,c,d,w)
y=zeros(size(x1,2),1);
for i=1:size(x1,2)
    x=x1(1,i);
if b~=c
    y(i,1)=w/(b-a)*(x-a)*(a<=x&x<=b)+w*(b<x&x<=c)+w/(c-d)*(x-d)*(c<x&x<=d);
else 
    y(i,1)=w/(b-a)*(x-a)*(a<=x&x<=b)+w/(c-d)*(x-d)*(c<x&x<=d);
end
end
end