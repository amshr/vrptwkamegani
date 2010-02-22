function routes=innerVns(routes, A, disttab, capacity)
    cost=totalCost(routes, disttab, 0)
    improvement=1;
    while improvement==1
        for i=1:1
            if i==1
                newRoutes=twoInterchange(routes, A, disttab, capacity);
                %lembrar d por um break se jah for improvado no 1o anel
            end
        end
        newCost=totalCost(newRoutes, disttab, 0)
        if cost==newCost
            improvement=0;
        else
            routes=newRoutes;
            cost=newCost;
        end
    end