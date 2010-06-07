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
    cost = B(previous+1, j) + B(next+1, j+1) - B(previous+1, next+1);
    costs = [costs [cost; i]];
end

%For first, only if the current route has more than one client
cost = B(1, j+1) + B(route(1)+1,j+1) - B(1, route(1)+1);
costs = [[cost; 0] costs];

%For last
cost = B(route(m)+1,j+1) + B(1,j+1) - B(route(m)+1, 1);
costs = [costs [cost; m]];