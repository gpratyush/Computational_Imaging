%to plot
x=[1:100];
y=zeros(100,1);
for i=1:100
    y(i)=x(i)/(x(i)+1);
end
figure(1)
plot(x,y)
y=zeros(100,1);
for i=1:100
    y(i)=x(i)
end
figure(2)
plot(y,x)

