function B= Hajjari(A,alpha)  %最后一个数以0结尾时是三角模糊数，非零是梯形模糊数
B=zeros(size(A,1),5)
C=zeros(size(A,1),1)
for i=1:size(A,1)
    if A(i,5)==0
       a=A(i,1)
       b=A(i,2)
       c=A(i,3)
       
    end
    if A(i,5)~=0
        a=A(i,1)
        b=A(i,2)
        c=A(i,3)
        d=A(i,4)
        w=A(i,5)
        C(i,1)=1/3*(b+c)+1/6*(a+d)
    end
end
for i=1:size(A,1)
    if A(i,5)==0
    a=A(i,1)
    b=A(i,2)
    c=A(i,3)
    w=A(i,4)
    Mean=1/3*(2*b-a-c)+1/2*(a+c)
    Variance=1/24*(c-a)^2*w^2
    S=1/4*(b-Mean)^4*w/(b-a)-1/20*w*((b-Mean)^5-(a-Mean)^5)/((b-a)^2)-1/4*(b-Mean)^4*w/(c-b)+1/20*w*((c-Mean)^5-(b-Mean)^5)/((c-b)^2)
    H=D*(atan(alpha*S+(1-alpha)*sqrt(Variance))+1/2)
    B(i,1)=Mean+Mean*2/pi*atan(sqrt(Variance))
    B(i,2)=Mean+Mean*2/pi*atan(S)
    B(i,3)=Mean+Mean*2/pi*atan(1/2*S+1/2*sqrt(Variance))
    B(i,4)=sqrt(Variance)
    B(i,5)=S
    end
    if A(i,5)~=0
        a=A(i,1)
        b=A(i,2)
        c=A(i,3)
        d=A(i,4)
        w=A(i,5)
        Mean=1/3*(b+c)+1/6*(a+d)
        Variance=((b-c)^2/8+(b-c)*(a-d)/12+(d-a)^2/24)*w^2
        S=1/4*(b-Mean)^4*w/(b-a)-1/20*w*((b-Mean)^5-(a-Mean)^5)/((b-a)^2)-1/4*(c-Mean)^4*w/(d-c)+1/20*w*((d-Mean)^5-(c-Mean)^5)/((d-c)^2)
        B(i,1)=Mean+Mean^alpha*sqrt(Variance)
        B(i,2)=Mean+Mean^alpha*S
        B(i,3)=Mean
        B(i,4)=sqrt(Variance)
        B(i,5)=S
    end
end
end
