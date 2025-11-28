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
 D=ones(15,10,11);
 M=ones(10,4,11);
 %定义目标函数
 num=20;
 al=linspace(0,1,num);
 for k=1:length(al)
     fun_xinfangfa=@(x) fx_xinfangfa(x,B,A,15,al(:,k));
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
     [x2,fval2]=fminimax(fun_xinfangfa,x0,[],[],Aeq,beq,lb,ub,[],options);
     lamda=linspace(4.7226,6.5471,10);
     H=zeros(10,4);
     for i=1:10
         fun_varaince=@(x)fx_varaince(x,B,15,lamda(i));
         p= fgoalattain(fun_xinfangfa,x0,-0.3,1,[],[],Aeq,beq,lb,ub,fun_varaince);
         H(i,1)=fun_qiwang(p);
         H(i,2)=fun_fangcha(p);
         H(i,3)=fun_swekeness(p);
         H(i,4)=H(i,1)/sqrt(H(i,2));
         D(:,i,k)=p';
     end
     M(:,:,k)=H;
 end