function allRoutes=exchangeTwoCustomers(A, B, capacity, allRoutes, routeToModify)
routeToModify
route=allRoutes(routeToModify, :);
route=removeZeros(route);
[m,n]=size(route);
found=0;
for i=1:n
    for j=i:n
        e=route(i);
        route(i)=route(j);
        route(j)=e;
        if checkFeasibility(A, B, route, capacity);
            found=1;
            break;
        end
    end
    if found
        break;
    end
end
if found==0
    for i=1:n
        allRoutes(routeToModify, i)=route(i);
    end
end
