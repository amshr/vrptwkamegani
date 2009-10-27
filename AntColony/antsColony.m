function route=antsColony(A, B, capacity, numberOfAnts)

phero=[];
clients=A(:, 1);
best_feasible=PFIH(A, B, capacity);
best_feasible_cost=totalDistance(best_feasible, B);
not_visited=[];
[best_route, best_not_visited, phero]=make_way(capacity, clients, A, B, phero, not_visited);
[best_size_not_visited, n]=size(best_not_visited);
for i=1:numberOfAnts
    [current_route, not_visited, phero]=make_way(capacity, clients, A, B, phero, not_visited);
    [size_not_visited, n]=size(not_visited);
    if size_not_visited<best_size_not_visited
        best_route=current_route;
        best_not_visited=not_visited;
    end
    if size_not_visited==0
        current_cost=totalDistance(current_route, B);
        if current_cost<best_feasible_cost
            best_feasible=current_route;
            best_feasible_cost=current_cost;
        end
    end
    phero=global_update(phero, best_route, B, lambda);
    phero=global_update(phero, best_feasible, B, lambda);
end
route=best_feasible;