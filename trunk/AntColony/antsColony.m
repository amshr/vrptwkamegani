function route=antsColony(A, B, capacity, numberOfAnts)

lambda=0.1;
phero=[];
[m,n]=size(A);
for i=1:m
    clients(i)=i;
end
pfih_sol=PFIH(A, B, capacity);
best_feasible = pfih_sol;
best_feasible_cost=totalCost(best_feasible, B, 0);
[best_rows, cols] = size(best_feasible);
truck_value = best_feasible_cost/best_rows;
first_cost = totalCost(best_feasible, B, truck_value);
best_feasible_cost = first_cost;
phero=phero_initialize(phero, best_feasible_cost, m);
tauZero = 1/(best_feasible_cost*m);
a=0
[best_route, phero]=make_way(capacity, clients, A, B, phero, tauZero);
k=1
while 1
    k=k+1
    for i=1:numberOfAnts
        ant=i;
        [current_route, phero]=make_way(capacity, clients, A, B, phero, tauZero);
        current_cost=totalCost(current_route, B, truck_value);
        if current_cost<best_feasible_cost
            best_feasible=current_route;
            best_feasible_cost=current_cost;
            a=0;
        end
    end
    phero=global_update(phero, best_route, B, lambda);
    phero=global_update(phero, best_route, B, lambda);
    a=a+1
    if (a>50)
        break
    end
end
truck_value
pfih_sol
first_cost = totalCost(pfih_sol, B, 0)
best_feasible_cost = totalCost(best_feasible, B, 0)
route=best_feasible;