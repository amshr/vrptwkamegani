function phero=phero_initialize(phero, best_feasible_cost, m)

for i=1:m+1
    for j=1:m+1
        phero(i,j)=1/(m*best_feasible_cost);
        phero(j,i)=phero(i,j);
    end
end