function route=antsColony(A, B, capacity, numberOfAnts)

capacity=30;
lambda=0.5;
phero=[];
[m,n]=size(A);
for i=1:m
    clients(i)=i;
end
best_feasible=PFIH(A, B, capacity);
best_feasible_cost=totalDistance(best_feasible, B);
phero=phero_initialize(phero, best_feasible_cost, m);
not_visited=[];
was_left=zeros(m,1);
[best_route, best_not_visited, phero]=make_way(capacity, clients, A, B, phero, was_left);
[best_size_not_visited, n]=size(best_not_visited);
for k=1:50
    for i=1:numberOfAnts
        ant=i;
        [current_route, not_visited, phero]=make_way(capacity, clients, A, B, phero, was_left);
        current_route=current_route
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
        was_left=left_update(was_left, not_visited);
    end
end
route=best_feasible;