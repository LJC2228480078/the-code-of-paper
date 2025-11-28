A=[-0.0369,-0.0077,0.0076,0.0559;
   -0.0575,-0.0158,0.0048,0.0562;
   -0.0165,0,0.0034,0.0256;
   -0.0305,-0.0066,0.0045,0.0378;
   -0.0434,-0.0056,0.0097,0.0604;
   -0.0514,-0.0085,0.0073,0.0675;
   -0.0479,-0.0105,0.0125,0.0516;
   -0.0614,-0.0173,0.0082,0.0829;
   -0.0375,-0.0074,0,0.0225;
   -0.0581,-0.0165,0.0084,0.0665;
   -0.0764,-0.0061,0.0078,0.0382;
   -0.0862,-0.0190,0.0054,0.0960;
   -0.0695,-0.0126,0.0160,0.0701;
   -0.0572,-0.0096,0.0124,0.0630;
   -0.0348,-0.0061,0.0078,0.0382;].*100;
 B(:,1)=A(:,2)-A(:,1);
 B(:,2)=A(:,3)-A(:,2);
 B(:,3)=A(:,4)-A(:,3);
% 定义目标函数
fun_MV = @(x) fx_MV(x,B,A,15);
fun_xinfangfa=@(x) fx_xinfangfa(x,B,A,15,1);
fun_minkefusiji=@(x) fx_minkefusiji(x,B,A,15);
fun_goldenrulefa=@(x) fx_goldenrulefa(x,B,A,15);
fun_score=@(x) fx_score(x,B,A,15);
fun_fangcha=@(x) fangcha(x,B,15);
fun_qiwang=@(x) qiwang(x,A,15);
fun_swekeness=@(x) swekeness(x,B,15);
% 生成初始解
x0 = rand(1, 15);

% 设置约束条件等参数
Aeq=ones(1,15);
beq=1;
lb=ones(1,15)*0.05;
ub=ones(1,15)*0.5;
options = optimoptions('fminimax', 'MaxIterations', 20000, 'ConstraintTolerance', 1e-16, 'StepTolerance', 1e-16);


% [x1,fval1]=fminimax(fun_MV,x0,[],[],Aeq,beq,lb,ub,[],options);
[x2,fval2]=fminimax(fun_xinfangfa,x0,[],[],Aeq,beq,lb,ub,[],options);
[x3,fval3]=fminimax(fun_minkefusiji,x0,[],[],Aeq,beq,lb,ub,[],options);
[x4,fval4]=fminimax(fun_goldenrulefa,x0,[],[],Aeq,beq,lb,ub,[],options);
[x5,fval5]=fminimax(fun_score,x0,[],[],Aeq,beq,lb,ub,[],options);
fun_fangcha(x3)
fun_qiwang(x3)
fangcha(x5,B,15)
%[x3,fval] = fgoalattain(fun_minkefusiji,x0,-0.3,1,[],[],Aeq,beq,lb,ub);
%x4 = fgoalattain(fun_xinfangfa,x0,-0.3,1,[],[],Aeq,beq,lb,ub);
%fun_MV(x3)

%模型求解

%经典的M-V模型
lamda=linspace(4.7226,6.5471,10);
H=zeros(10,4);
for i=1:10
fun_varaince=@(x)fx_varaince(x,B,15,lamda(i));
p= fgoalattain(fun_MV,x0,-0.3,1,[],[],Aeq,beq,lb,ub,fun_varaince);
H(i,1)=fun_qiwang(p);
H(i,2)=fun_fangcha(p);
H(i,3)=fun_swekeness(p);
H(i,4)=H(i,1)/sqrt(H(i,2));
end

%新方法
lamda=linspace(4.7226,6.5471,10);
H=zeros(10,4);
for i=1:10

fun_varaince=@(x)fx_varaince(x,B,15,lamda(i));
p= fgoalattain(fun_xinfangfa,x0,-0.3,1,[],[],Aeq,beq,lb,ub,fun_varaince);
H(i,1)=fun_qiwang(p);
H(i,2)=fun_fangcha(p);
H(i,3)=fun_swekeness(p);
H(i,4)=H(i,1)/sqrt(H(i,2));
end

%闵可夫斯基函数模型
lamda=linspace(4.7226,7.9642,10);%9.0631
J=zeros(10,5);
for i=1:10
fun_varaince=@(x)fx_varaince(x,B,15,lamda(i));
p= fgoalattain(fun_minkefusiji,x0,-0.3,1,[],[],Aeq,beq,lb,ub,fun_varaince);
J(i,5)=-fun_minkefusiji(p);
J(i,1)=fun_qiwang(p);
J(i,2)=fun_fangcha(p);
J(i,3)=fun_swekeness(p);
J(i,4)=J(i,1)/sqrt(J(i,2));
end

%score模型
lamda=linspace(4.7226,6.5471,10);
K=zeros(10,3);
for i=1:10
fun_varaince=@(x)fx_varaince(x,B,15,lamda(i));
p= fgoalattain(fun_score,x0,-0.3,1,[],[],Aeq,beq,lb,ub,fun_varaince);
K(i,1)=fun_qiwang(p);
K(i,2)=fun_fangcha(p);
K(i,3)=fun_swekeness(p);
K(i,4)=K(i,1)/sqrt(K(i,2));
end

%Expected Return
figure(1)
plot(H(:,2),H(:,1),"o-",K(:,2),K(:,1),"+-","LineWidth",1)
set(gca,"LineWidth",1.5)
legend("MV-Model","Score V-Model",Location="northwest")
xlabel("Risk")
ylabel("Expected Rate of Return ")
% xlabel("风险")
% ylabel("预期收益率")


%Skewness
figure(2)
plot(K(:,2),K(:,3),"o-",H(:,2),H(:,3),"+-","LineWidth",1)
set(gca,"LineWidth",1.5)
legend("Score V-Model","MV-Model",Location="northwest")
xlabel("Risk")
ylabel("Skewness")
% xlabel("风险")
% ylabel("偏度")


%Skewness
figure(3)
plot(H(:,2),H(:,4),"o-",K(:,2),K(:,4),"+-","LineWidth",1)
set(gca,"LineWidth",1.5)
legend("MV-Model","Score V-Model",Location="northwest")
xlabel("Risk")
ylabel("Sharpe Ratio")
% xlabel("风险")
% ylabel("夏普比率")


%Skewness
figure(4)
plot(J(:,2),J(:,1),"o-",J(:,2),J(:,5),"*-","LineWidth",1)
set(gca,"LineWidth",1.5)
legend("Rate of Return","Score of Minkowski distance function",Location="northwest")
xlabel("Risk")
ylabel("Rate of Return or Score")
% legend("收益率","闵可夫斯基距离函数评分值",Location="northwest")
% xlabel("风险")
% ylabel("收益率以及评分值")
ylim([0,1.6])
% 定义目标函数