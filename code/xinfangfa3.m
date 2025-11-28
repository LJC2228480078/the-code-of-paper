function B= xinfangfa3(A,alpha)  %最后一个数以0结尾时是三角模糊数，非零是梯形模糊数
B=zeros(size(A,1),6);
C=zeros(size(A,1),1);
D=zeros(size(A,1));
for i=1:size(A,1)
    if A(i,5)==0
       a=A(i,1);
       b=A(i,2);
       c=A(i,3);
       w=A(i,4);
       C(i,1)=1/3*(2*b-a-c)+1/2*(a+c);
    end
    if A(i,5)~=0
        a=A(i,1);
        b=A(i,2);
        c=A(i,3);
        d=A(i,4);
        w=A(i,5);
        C(i,1)=1/3*(b+c)+1/6*(a+d);
    end
end
Da=[1,1,1,0];
for i=1:size(A,1)
    DA=Da(1,i);
    if A(i,5)==0
    a=A(i,1);
    b=A(i,2);
    c=A(i,3);
    w=A(i,4);
    Mean=1/3*(2*b-a-c)+1/2*(a+c);
    Variance=1/24*((c-b)^3+(b-a)^3)*w;
    if Mean>=0
        u=1;
    else 
        u=-1;
    end
    S=-(1/4*(b-Mean)^4*w/(b-a)-1/20*w*((b-Mean)^5-(a-Mean)^5)/((b-a)^2)-1/4*(b-Mean)^4*w/(c-b)+1/20*w*((c-Mean)^5-(b-Mean)^5)/((c-b)^2));
    H=DA*(1/pi*atan(alpha*u*S+(1-alpha)*sqrt(Variance))+1/2);
    B(i,1)=Mean+sqrt(Variance);
    B(i,2)=Mean+Mean*H;
    B(i,3)=Mean;
    B(i,4)=sqrt(Variance);
    B(i,5)=S;
    end
    if A(i,5)~=0
        a=A(i,1);
        b=A(i,2);
        c=A(i,3);
        d=A(i,4);
        w=A(i,5);
        Mean=1/3*(b+c)+1/6*(a+d);
        if Mean>=0
            u=1;
        else
            u=-1;
        end
        Variance=((b-c)^2/8+(b-c)*(a-d)/12+(d-a)^2/24)*w^2;
        S=-(1/4*(b-Mean)^4*w/(b-a)-1/20*w*((b-Mean)^5-(a-Mean)^5)/((b-a)^2)-1/4*(c-Mean)^4*w/(d-c)+1/20*w*((d-Mean)^5-(c-Mean)^5)/((d-c)^2));
        H=DA*(1/pi*atan(alpha*u*S+(1-alpha)*sqrt(Variance))+1/2);
        B(i,1)=Mean+sqrt(Variance);
        B(i,2)=Mean+Mean*H;
        B(i,3)=Mean;
        B(i,4)=sqrt(Variance);
        B(i,5)=S;
    end
end
% 处理矩阵B的第2列，按降序分配排名（最大值排名为1）
% 提取第2列数据
colData = B(:, 2);

% 提取唯一值并按降序排序（不使用'sorted'选项，手动排序）
uniqueVals = unique(colData);       % 提取唯一值（默认升序）
uniqueVals = uniqueVals(end:-1:1);  % 反转得到降序的唯一值

% 为每个唯一值分配排名（第1个元素是最大值，排名为1）
[~, idx] = ismember(colData, uniqueVals);  % 找到原始数据在降序唯一值中的索引

% 将索引直接作为排名（最大值对应索引1）
B(:, 6) = idx;
end