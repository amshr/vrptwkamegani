function route=antsColony(A, B, capacity, numberOfAnts)

lambda=0.1;
phero=[];
[m,n]=size(A);
for i=1:m
    clients(i)=i;
end
pfih_sol=PFIH(A, B, capacity);
best_feasible = pfih_sol;
best_feasible_cost=totalDistance(best_feasible, B, 0);
[best_rows, cols] = size(best_feasible);
truck_value = best_feasible_cost/best_rows;
first_cost = totalDistance(best_feasible, B, truck_value);
best_feasible_cost = first_cost;
phero=phero_initialize(phero, best_feasible_cost, m);
tauZero = 1/(best_feasible_cost*m);
[best_route, phero]=make_way(capacity, clients, A, B, phero, tauZero);
for k=1:50
    for i=1:numberOfAnts
        ant=i;
        [current_route, phero]=make_way(capacity, clients, A, B, phero, tauZero);
        current_route
        current_cost=totalDistance(current_route, B, truck_value)
        if current_cost<best_feasible_cost
            best_feasible=current_route;
            best_feasible_cost=current_cost;
        end
    end
    phero=global_update(phero, best_route, B, lambda);
end
truck_value
pfih_sol
first_cost
best_feasible_cost
route=best_feasible;