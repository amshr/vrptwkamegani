function drawRoute(A,bestRoutes)

x=A(:,1);
y=A(:,2);
newplot;
n = length(x);
[blin, bcol] = size(bestRoutes);
c=[1:n]';
c=int2str(c);
hold all
plot(x,y,'o',0,0,'r*');
text(x,y,c,'fontsize',12);
for i=1:blin,
  plot([0,x(bestRoutes(i,1))],[0,y(bestRoutes(i,1))],'b');
  j=1;
  while (j<bcol)&&(bestRoutes(i,j+1)~=0),
    plot([x(bestRoutes(i,j)),x(bestRoutes(i,j+1))],[y(bestRoutes(i,j)),y(bestRoutes(i,j+1))],'b');
    j = j+1;
  end  
  plot([x(bestRoutes(i,j)),0],[y(bestRoutes(i,j)),0],'b');
end    
axis([min(x)-2 max(x)+2 min(y)-2 max(y)+2]);
