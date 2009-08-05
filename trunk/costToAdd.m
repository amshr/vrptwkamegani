function costs=costToAdd(route, j, B);
costs=[];
[n,m]=size(route);
for i=1:m-1
    previous = route(i);
    next = route(i+1);
    cost = B(previous+1, j) + B(next+1, j);
    costs = [costs [cost; i]];
end

if m>1
    cost = B(1, j) + B(route(1),j);
    costs = [[cost; 0] costs];
end

cost = B(route(m),j) + B(1,j);
costs = [costs [cost; m]];