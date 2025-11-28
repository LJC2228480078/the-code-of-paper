function B=score(A)
w1=1/2;
w2=1/3;
w3=1/6;
B=zeros(size(A,1),4);
for i=1:size(A,1)
    if A(i,5)==0
       a=A(i,1);
       b=A(i,2);
       c=A(i,2);
       d=A(i,3);
       w=A(i,4);
    end
    if A(i,5)~=0
        a=A(i,1);
        b=A(i,2);
        c=A(i,3);
        d=A(i,4);
        w=A(i,5);
    end
    x1=1/(b-a)*(1/3*b^3-1/2*a*b^2+1/6*a^3)+1/2*c^2-1/2*b^2+1/(c-d)*(-1/6*d^3-1/3*c^3+1/2*d*c^2);
    x2=1/(b-a)*(1/2*b^2-a*b+1/2*a^2)+c-b+1/(c-d)*(-1/2*d^2-1/2*c^2+c*d);
    xa=x1/x2;
    ha=w;
    if xa>=0
        u=1;
    else 
        u=-1;
    end
    x3=(a+b+c+d)/4;
    STDA=sqrt(((a-x3)^2+(b-x3)^2+(c-x3)^2+(d-x3)^2)/3);
    score=w1*xa+u*w2*ha+w3*u/(1+STDA);
    B(i,1)=score;
    B(i,2)=xa;
    B(i,3)=u;
    B(i,4)=STDA;
end 
