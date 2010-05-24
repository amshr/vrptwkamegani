function [route, improv]=2opt(route, B)

route=normalize(route);
cost=totalCost(route);
[m,n]=size(route);
improv=0;
if n<=2
    return
end

for i=1:n
    for j=i+1:n
        for k=1:i
            newRoute=[newRoute route(k)];
        end
        for k=i:j
            pieceToAdd=[route(k) pieceToAdd];
        end
        newRoute=[newRoute pieceToAdd];
        for k=j:n
            newRoute=[newRoute route(k)];
        end
        if isFeasible(newRoute)
            newCost=totalCost(newRoute);
            if newCost<cost
                improv=1;
                route=newRoute;
                return
            end
        end
    end
end