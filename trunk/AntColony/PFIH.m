function trucks=PFIH(A, B, capacity)

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
    routeCapacity=capacity;
    for i=1:m
        j=sortedCustomers(i);
        if(B(1,j+1)<A(j,5))&&(A(j,3)<routeCapacity);
            firstCustomer=j;
            sortedCustomers = removeElement(sortedCustomers,i,1);
            break
        end
    end
    if (firstCustomer == 0)
        fprintf ('Solução inexistente');
        routes=0;
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
            if (isTimeFactible(A, B, route, routePosition+1, j))
                route = addAt(route, j, routePosition);
                reverseCustomers = removeElement(reverseCustomers, i, 1);
            end
            i = i-1;
            if (i==0)
                needNewRoute=1;
            end
            sortedCustomers= fliplr(reverseCustomers);
        else
            [n,m]=size(route);
            for o=1:m
                routes(r,o) = route(o);
            end
            i=i-1;
            sortedCustomers= fliplr(reverseCustomers);
        end
    end
end
[m,n]=size(routes);
trucks=m;