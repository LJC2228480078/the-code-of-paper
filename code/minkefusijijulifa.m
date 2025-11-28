function C=minkefusijijulifa(A,p)
B=zeros(size(A,1),4);
C=B;
beta1=1;
beta2=1;
beta3=1;
for i=1:size(A,1)
    if A(i,5)==0
       a=A(i,1);
       b=A(i,2);
       c=A(i,3);
       w=A(i,4);
       Mean=1/3*(2*b-a-c)+1/2*(a+c);
       stdVariance=sqrt(1/24*(c-a)^2*w^2);
       sup=max(A(i,:));
       Mag=(beta1*Mean^p+beta2*stdVariance^p)^1/p;
    end
    if A(i,5)~=0
        a=A(i,1);
        b=A(i,2);
        c=A(i,3);
        d=A(i,4);
        w=A(i,5);
        Mean=1/3*(b+c)+1/6*(a+d);
        stdVariance=sqrt(((b-c)^2/8+(b-c)*(a-d)/12+(d-a)^2/24)*w^2);
        sup=max(A(i,:));
        Mag=(beta1*Mean^p+beta2*stdVariance^p)^1/p;
    end
        B(i,1)=Mag;
        B(i,2)=Mean;
        B(i,3)=stdVariance;
        B(i,4)=sup;
end 
amax=max(B(:,2));
amin=min(B(:,2));
bmax=max(B(:,3));
bmin=min(B(:,3));
cmax=max(B(:,4));
cmin=min(B(:,4));
for i=1:size(B(:,1))
   C(i,1)=(B(i,2)-amin)/(amax-amin);
   C(i,2)=(B(i,3)-bmin)/(bmax-bmin);
   C(i,3)=(B(i,4)-cmin)/(cmax-cmin);
   C(i,4)=(beta1*C(i,1)^p+beta2*C(i,2)^p)^1/p;
end
