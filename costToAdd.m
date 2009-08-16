function costs=costToAdd(route, j, B);
%Calculates the costs to add a new client between each pair of current
%clients in the route and returns a list.
%The second row is the position after which the client should be added.

costs=[];
[n,m]=size(route);
%For position 2 to m-1
for i=1:m-1
    previous = route(i);
    next = route(i+1);
    cost = B(previous+1, j) + B(next+1, j);
    costs = [costs [cost; i]];
end

%For first, only if the current route has more than one client
if m>1
    cost = B(1, j) + B(route(1),j);
    costs = [[cost; 0] costs];
end

%For last
cost = B(route(m),j) + B(1,j);
costs = [costs [cost; m]];