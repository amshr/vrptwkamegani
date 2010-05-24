function [routes, improv]=randTwopt(A, B, routes, capacity, a)

[y,o]=size(routes);

for h=randi(y):y
    route=routes(h,:);
    route=normalize(route);
    cost=totalCost(route, B, 0);
    [m,n]=size(route);
    improv=0;
    if n<=2
        return
    end

    for i=randi(n):n
        for j=i+1:n
            newRoute=[];
            pieceToAdd=[];
            for k=1:i-1
                newRoute=[newRoute route(k)];
            end
            for k=i:j-1
                pieceToAdd=[route(k) pieceToAdd];
            end
            newRoute=[newRoute pieceToAdd];
            for k=j:n
                newRoute=[newRoute route(k)];
            end
            if checkFeasibility(A, B, route, capacity);
                newCost=totalCost(newRoute, B, 0);
                costwo=newCost;
                for p=1:n
                    routes(h, p)=newRoute(p);
                end
                costwo=totalCost(routes, B,0)
                return
            end
        end
    end
end
if a>30
    a
    newRoutes=route;
    return 
end
if improv==0
    [newRoutes improv]=randTwopt( A, B,routes, capacity, a+1);
end