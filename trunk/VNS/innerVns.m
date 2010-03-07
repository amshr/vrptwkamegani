function [routes imp cost]=innerVns(routes, A, disttab, capacity)
    cost=totalCost(routes, disttab, 0);
    k=1;
    imp=0;
    while k<=2
        if k==1
            [routes, improvement]=twoInterchange(routes, A, disttab, capacity);
            if improvement==0
                k=k+1;
            else
                imp=1;
            end
        end
        if k==2
            [routes, improvement]=crossExchange(A, disttab, routes, capacity);
            if improvement==1
                k=1;
                imp=1;
            else
                k=k+1;
            end
        end
    end
    newCost=totalCost(routes, disttab, 0);
    cost=newCost;