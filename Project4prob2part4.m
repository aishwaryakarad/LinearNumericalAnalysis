n=100;
A=gallery("poisson",n);
tol=1e-5;
ews=eig(A);
% rho=ews(n*n)+0.001;


%disp(ews);
lamda=zeros([3 1]);
% v=zeros([n*n 1]);
% v(n*n,1)=1;
v=rand(n*n,1);
v=v/norm(v,2);
told=1;
%resvec=zeros([20 1]);

  rho=0
 ev=zeros(3,100);
 iter=0;
 B= A-rho*eye(size(A)); 
Binv= inv(B);
y=Binv*v;
size(y);
theta=norm(y,2);
v=y/norm(y,2);
t1=A*v;
t2=v'*t1;

for i=1:3
    
    
   for j=1:10
        B= A-rho*eye(size(A)); 
        Binv= inv(B);
        y=Binv*v;
        size(y);
        theta=norm(y,2);
        v=y/norm(y,2);
        t1=A*v;
        t2=v'*t1;

        if abs(t2 - told)/told > tol 
            lamda(i)=t2;
            continue;
        end
       % told=lamda(i);
        lamda(i)
        rho=rho+(y*v/theta);
        rho
        temp=norm(A*v-rho*v,2);
        resvec(j,i)=temp/norm(v,2)
        iter=iter+1;
    
    end
    v=rand(n*n,1);
    v=v/norm(v,2);
end

rho
lamda
loglog(resvec);
