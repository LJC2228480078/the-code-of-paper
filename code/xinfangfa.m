function B= xinfangfa(A,alpha,leixing)  %leixing=1时是三角模糊数，leixing=2时是梯形模糊数
B=zeros(size(A,1),5)
if leixing==1
for i=1:size(A,1)
    a=A(i,1)
    b=A(i,2)
    c=A(i,3)
    w=A(i,4)
    Mean=1/3*(2*b-a-c)+1/2*(a+c)
    Variance=1/24*(c-a)^2*w^2
    S=1/4*(b-Mean)^4*w/(b-a)-1/20*w*((b-Mean)^5-(a-Mean)^5)/((b-a)^2)-1/4*(b-Mean)^4*w/(c-b)+1/20*w*((c-Mean)^5-(b-Mean)^5)/((c-b)^2)
    B(i,1)=Mean+Mean^alpha*sqrt(Variance)
    B(i,2)=Mean+Mean^alpha*S
    B(i,3)=Mean
    B(i,4)=sqrt(Variance)
    B(i,5)=S
end
end
if leixing==2
 for i=1:size(A,1)
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
if leixing==3
    for i=1:size(A,1)
    a=A(i,1)
    b=A(i,2)
    c=A(i,3)
    w=A(i,4)
    M1=w/(b-a)*(1/3*b^3+1/6*a^3-1/2*a*b^2)+w/(b-c)*(-1/6*c^3+1/2*c*b^2-1/3*b^3)
    M2=w/(b-a)*(1/2*b^2+1/2*a^2-a*b)+w/(b-c)*(-1/2*c^2+b*c-1/2*b^2)
    x=M1/M2
    Mean=1/3*(2*b-a-c)+1/2*(a+c)
    Variance=1/24*(c-a)^2*w^2
    B(i,1)=Mean+x*sqrt(Variance)
    B(i,2)=x
    B(i,3)=Mean
    B(i,4)=sqrt(Variance)
    end
end   
if leixing==4
    for i=1:size(A,1)
    a=A(i,1)
    b=A(i,2)
    c=A(i,3)
    d=A(i,4)
    w=A(i,5)
    M1=w/(b-a)*(1/3*b^3+1/6*a^3-1/2*a*b^2)+w/(b-c)*(-1/6*c^3+1/2*c*b^2-1/3*b^3)+w*(c-b)
    M2=1/2*(c-b+d-a)*w
    x=M1/M2
    Mean=1/3*(b+c)+1/6*(a+d)
    Variance=((b-c)^2/8+(b-c)*(a-d)/12+(d-a)^2/24)*w^2
    B(i,1)=Mean+x*sqrt(Variance)
    B(i,2)=x
    B(i,3)=Mean
    B(i,4)=sqrt(Variance)
    end
end   