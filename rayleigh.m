n=10;
A=gallery("poisson",n);
ews=eig(A);
v=rand(n*n,1);
v=v/norm(v,2);
rho=zeros([4 1]);
%rho(1)=ews(1)+0.0001;
k=1;
theta=0
p=1;
q=1;
lamdaapprox(1)=0;
delx=1/n;
p=2
q=1
lamdaapprox(2)=(4)*((sin(p*pi*delx/2))^2+(sin(q*pi*delx/2))^2);
p=2;
q=2;
lamdaapprox(3)=(4)*((sin(p*pi*delx/2))^2+(sin(q*pi*delx/2))^2);
for k=2:2
    %if k==2
     rho(k)=lamdaapprox(k) - 1E-6;
     %rho(k)= 0.3; 
    %end
    j=0;
    for z=1:10%abs(norm(A*v- rho(k).*v))>= 1e-6
        temp=rho(k).*eye(size(A));
        temp=A-temp;
        %temp=inv(temp)
        y=temp\v;
        theta= norm(y,2);
        del = (y'*v/theta^2)
        rho(k)=rho(k)+ del%(y'*v/theta^2);
        %(y'*v/theta^2)
        v=y/theta;
        res(z) =  abs(norm(A*y- rho(k).*y));
        if( abs(norm(A*y- rho(k).*y))<= 1e-6)
            abs(norm(A*y- rho(k).*y))
         break
        end
    end
    %rho(k+1)=rho(k)-(y'*v/theta^2);


end
rho