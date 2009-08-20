function routes=PFIH(A, B)

r=0;
route=[];
routes=[];
costs=minimumCost(A,B);
sortedCosts=quicksort(costs);
sortedCustomers=sortedCosts(2,:);
reverseCustomers=0;
needNewRoute=0;

while not(isempty(sortedCustomers))
    [u,v]=size(route);
    for j=1:v
        routes(r,j) = route(j);
    end
    r=r+1;
    [n,m]=size(sortedCustomers);
    firstCustomer=0;
    routeCapacity=35;
    for i=1:m
        j=sortedCustomers(i);
        if(B(1,j)<A(j,5))&(A(j,3)<routeCapacity);
            firstCustomer=j;
            sortedCustomers = removeElement(sortedCustomers,i,1);
            break
        end
    end
    if (firstCustomer == 0)
        fprintf ('Solução inexistente');
        return
    end
    route = firstCustomer;
    routeCapacity = routeCapacity - A(j,3);
    [n,m]=size(sortedCustomers);
    i=m;
    reverseCustomers = fliplr(sortedCustomers);
    if (isempty(reverseCustomers))
        [u,v]=size(route);
        for j=1:v
            routes(r,j) = route(j);
        end
    end
    while i>0
        j=reverseCustomers(i);
        if (A(j,3)<routeCapacity);
            routeCapacity = routeCapacity - A(j,3);
            costs = costToAdd(route, j, B);
            costs = quicksort(costs);
            routePosition = costs(2,1);
            check=isTimeFactible(A, B, route, routePosition+1, j);
            if (check==1)
                route = addAt(route, j, routePosition);
                reverseCustomers = removeElement(reverseCustomers, i,1);
            end
            i = i-1;   
            if (i==0)
                needNewRoute=1;
            end
        else
            [n,m]=size(route);
            for i=1:m
                routes(r,i) = route(i);
            end
            break;
        end
        if (isempty(reverseCustomers))
            [n,m]=size(route);
            for i=1:m
                routes(r,i) = route(i);
            end
            break;
        end
        sortedCustomers= fliplr(reverseCustomers);
    end
end
