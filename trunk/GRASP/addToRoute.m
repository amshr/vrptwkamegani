function [newRoute added]=addToRoute(customer, route, A, B, capacity)

added=0;
route=normalize(route);
[m,n]=size(route);
for i=1:n
    newRoute=addAt(route, customer, i);
    if checkFeasibility(A, B, newRoute, capacity)
        added=1;
        return 
    end
end
newRoute=0;
return 