function Rep=goldenrulefa(A,w)%w是模糊数的高度，这里输入为1个数，而非向量，因为我们模型求解时示例w都为1
a1=min(A(:,1));
Rep=zeros(size(A,1),3);
if a1<0
    A=A+abs(a1);
end
for i=1:size(A(:,1))
    A(i,:)=A(i,:)/max(max(abs(A(i,:))),1);
end
for i=1:size(A,1)
    if A(i,4)==0
       a=A(i,1);
       b=A(i,2);
       c=A(i,2);
       d=A(i,3);
    end
    if A(i,4)~=0
        a=A(i,1);
        b=A(i,2);
        c=A(i,3);
        d=A(i,4);
    end
    x1=1/(b-a)*(1/3*b^3-1/2*a*b^2+1/6*a^3)+1/2*c^2-1/2*b^2+1/(c-d)*(-1/6*d^3-1/3*c^3+1/2*d*c^2);
    x2=1/(b-a)*(1/2*b^2-a*b+1/2*a^2)+c-b+1/(c-d)*(-1/2*d^2-1/2*c^2+c*d);
    C=x1/x2;
    Rep(i,1)=C+(1/2-C)*w*x2;
    Rep(i,2)=x1;
    Rep(i,3)=x2;
end 


