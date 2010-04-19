function [routes imp cost]=innerVns(routes, A, disttab, capacity)
    cost=totalCost(routes, disttab, 0);
    k=1;
    imp=0;
    while k<=3
        if k==1
            [routes, improvement]=twoInterchange(routes, A, disttab, capacity);
        end
        if k==2
            [routes, improvement]=twopt(A, disttab, routes, capacity);
        end
        if k==3
            [routes, improvement]=crossExchange(A, disttab, routes, capacity);
        end
        if improvement==1
            k=1;
            imp=1;
        else
            k=k+1;
        end
    end
    newCost=totalCost(routes, disttab, 0);
    cost=newCost;