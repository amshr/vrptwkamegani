function bestRoutes=grasp(A, capacity)

B=disttab(A);
x1=PFIH(A, B, capacity);
x2=nearest_customer(A, B, capacity);
x3=random_customer_insertion(A, B, capacity);
best=totalCost(x1,B);
bestRoutes=x1;
i=0;
j=0;
k=3;
maxIteration=20;
maxTabuTenure=10;
mutationP=0.5;
while i<maxIteration
    i=i+1;
    if j<i
        j=j+1;
    else
        j=j-1;
    end
    tabuTenure=int8((maxTabuTenure*(maxIteration-j))/maxIteration);
    for h=1:k
        if h==1
            [newRoute, numberOfRoutes]=updateRoutes(A, B, capacity, tabuTenure, x1, mutationP);
        end
        if h==2
            [newRoute, numberOfRoutes]=updateRoutes(A, B, capacity, tabuTenure, x2, mutationP);
        end
        if h==3
            [newRoute, numberOfRoutes]=updateRoutes(A, B, capacity, tabuTenure, x3, mutationP);
        end
        %eu vou ter que organizar isso... ele soh tah vendo se algum custo
        %novo eh menor que o minimo e atualizando td
        newCost=totalCost(newRoute, B)
        if newCost<best
            best=newCost;
            bestRoutes=newRoute
            j=0;
        end
        routeToExchange=1+int8(rand(1,1)*(numberOfRoutes-1));
        if h==1
            x1=exchangeTwoCustomers(A, B, capacity, newRoute, routeToExchange);
        end
        if h==2
            x2=exchangeTwoCustomers(A, B, capacity, newRoute, routeToExchange);
        end
        if h==3
            x3=exchangeTwoCustomers(A, B, capacity, newRoute, routeToExchange);
        end
    end
end
bestRoutes