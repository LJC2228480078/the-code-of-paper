function  y= qiwang(x,A,n)
     y4=0;
     for i=1:n
         y4=y4+1/6*x(i)*A(i,1)+1/3*x(i)*A(i,2)+1/3*x(i)*A(i,3)+1/6*x(i)*A(i,4);
     end
     y=y4;
end

