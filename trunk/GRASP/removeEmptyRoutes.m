function [bestCostMatrix routes]=removeEmptyRoutes(bestCostMatrix, routes)

[n,m]=size(routes);
removed=0;

for i=1:n
    if (routes(i,1)==0)
        if (routes(i,2)==0)
            bestCostMatrix(i-removed,:)=[];
            bestCostMatrix(:,i-removed)=[];
            routes(i,2)=1;
        else
            removed=removed+1;
        end
    end
end