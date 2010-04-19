function [routes, improv]=twopt(A, B, routes, capacity)

[m,n]=size(routes);

for h=1:m
    route=routes(h, :);
    route=normalize(route);
    cost=totalCost(route, B, 0);
    improv=0;
    [u,n]=size(route);
    if n>2
        for i=1:n
            for j=i+1:n
                newRoute=[];
                pieceToAdd=[];
                for k=1:i-1
                    newRoute=[newRoute route(k)];
                end
                for k=i:j
                    pieceToAdd=[route(k) pieceToAdd];
                end
                newRoute=[newRoute pieceToAdd];
                for k=j+1:n
                    newRoute=[newRoute route(k)];
                end
                if checkFeasibility(A, B, route, capacity);
                    newCost=totalCost(newRoute, B, 0);
                    if newCost<cost
                        improv=1;
                        route=newRoute;
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
    end
end