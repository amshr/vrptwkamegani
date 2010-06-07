function [newRoute, m]=updateRoutes(A, B, capacity, tabuTenure, solutionToUpdate, mutationP) 
newRoute=tabuSearch(A, capacity, tabuTenure, solutionToUpdate);
[m,n]=size(newRoute);
for o=1:m
    if rand(1,1)<mutationP
      newRoute=exchangeTwoCustomers(A, B, capacity, newRoute, o);
    end
end