function bestCostMatrix=removeEmptyRoutes(emptyRoutes, bestCostMatrix)

[n,m]=size(emptyRoutes);

for i=1:m
    bestCostMatrix(emptyRoutes(i),:)=[];
    bestCostMatrix(:,emptyRoutes(i))=[];
end