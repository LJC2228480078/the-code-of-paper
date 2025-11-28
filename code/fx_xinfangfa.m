function y= fx_xinfangfa(x,B,A,n,al)
    % 计算目标函数值
%     y1=x(1).*B(1,1); % 初始化为第一个变量
%     y2=x(1).*B(1,2);
%     y3=x(1).*B(1,3);
%     for i=2:n
%         y1=y1+x(i).*B(i,1); % 与下一个变量相乘
%         y2=y2+x(i).*B(i,2);
%         y3=y3+x(i).*B(i,3);
%     end
%      y(1)=1/18*y1.^2+1/4*y2.^2+1/18*y3.^2+1/6*y1*y2+1/18*y1*y3+1/6*y2*y3;
     y4=0;
     A(:,5)=1;
     C=xinfangfa2(A,al);
     D=C(:,2);
     for i=1:n
         y4=y4+x(i).*D(i);
     end
     y=-y4;
end
