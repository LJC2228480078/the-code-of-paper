% B=[2.2 4 6 0.9 0;
%    2.2 4 6 1 0;
%    1 4 5 0.8 0;
%    3 4 7 0.8 0];
B =[
    2   5    8   1   0;    % A1（右偏）：E=5，左长3 < 右长4
    3   4.5  9   1   0;    % A2（对称）：E=5，左右等长2
    1   5.5  7   1   0;    % A3（左偏）：E=5，左长5 > 右长4
    4   10   16  1  0];   % A4（参照）：E=10，确保D≠0];

a=1;
b=5.5;
c=7;
w=1;
Mean=1/6*a+2/3*b+1/6*c;
S=-(1/4*(b-Mean)^4*w/(b-a)-1/20*w*((b-Mean)^5-(a-Mean)^5)/((b-a)^2)-1/4*(b-Mean)^4*w/(c-b)+1/20*w*((c-Mean)^5-(b-Mean)^5)/((c-b)^2))
A2=xinfangfa2(B,1);
C=[3 5 6 8 1;
   3 5 6 8 0.8;
   3 5 6 9 1;
   3 5 6 9 0.7];
B1=xinfangfa2(C,0);
D=[-4 0 4 1 0;
   -2 0 2 1 0;
   0 1 1.9 1 0;
   0 2 2.9 1 0;];
C1=xinfangfa2(D,0);
M=1/3*ones(4,6,11);
H=1/3*ones(4,6,11);
J=1/3*ones(4,6,11);
alpha=linspace(0,1,11);
for k=1:length(alpha)
    M(:,:,k)=xinfangfa3(B,alpha(:,k));
    H(:,:,k)=xinfangfa2(C,alpha(:,k));
    J(:,:,k)=xinfangfa2(D,alpha(:,k));
end

fixed_plot_3d_matrix(M,alpha)
