function viewJoints(A)


R=[20 20]';
L=60;

n=10; %edges
m=2;

theta = (0:n)/n*360;
sintheta = sind(theta); sintheta(n+1) = 0;

x = R * cosd(theta);
y = R * sintheta;
z(1,1:n+1)=-L/2;
z(2,1:n+1)=L/2;

for j=1:2
for i=1:n+1
    
    P=A*[x(j,i) y(j,i) z(j,i) 1]';
    X(j,i)=P(1);
    Y(j,i)=P(2);
    Z(j,i)=P(3);
    

end
end
surf(X,Y,Z)
colormap([0.5 0.5 1])
end
