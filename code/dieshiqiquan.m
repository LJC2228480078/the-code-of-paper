function y=dieshiqiquan(S,sigma,r,T,h)
%S是股票的初始价格，sigma是波动率，r是无风险利率，T是有效期，h是步数
u=exp(sigma*sqrt(T/h));
d=1/u;
p=(exp(r*(T/h))-d)/(u-d);
V=zeros(2*h+1,1);
%计算二叉树末端各个节点上期权的价格
for i=-h:2:h
    St=S*u^i;
    V(i+h+1)=max(0,min(St-90,110-St));
end
%利用风险中性定价公式逐步倒推
for n=h-1:-1:0
    for j=-n:2:n
        V(j+h+1,1)=(p*V(j+1+h+1)+(1-p)*V(j-1+h+1))*exp(-r*(T/h));
    end
end
y=V(h+1);%0时刻股票价格为S对应的期权价格
end