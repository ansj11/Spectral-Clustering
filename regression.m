e = rand(10,1)/10;
x=[pi/10:pi/10:pi]';
y=sin(x)+e;

for i=1:5
    for j=1:10
        A(i,j)=x(j)^(i-1);
    end
end
l=0.1;
w=inv(A*A'+l*ones(5))*A*y;
z=w'*A;
norm(z'-y)

figure(1)
subplot(121),plot(x,y,'-');
subplot(122),plot(x,z,'-');

