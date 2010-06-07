function bestRoutes=tabuSearch(A, capacity, tabuTenure, solution)

stream=RandStream('mrg32k3a');

B=disttab(A);
routes=solution;
currentCost=totalCost(routes, B)
[n,m]=size(routes);
if n==1
    bestRoutes=routes;
    bestCost=totalCost(routes, B)
    return
end 
if routes==0
    bestRoutes=routes;
    return
end
routes=twoInterchange(routes, A, B, capacity);
[n,m]=size(routes);
if n==1
    bestRoutes=routes;
    bestCost=totalCost(routes, B)
    return
end    
currentCost=totalCost(routes, B);
tabuListSize=tabuTenure;
tabuList=[];
bestRoutes=routes;
bestCost=totalCost(bestRoutes, B);
iteration=0;
[bestCostMatrix bestCostList]=createBCs(routes,A,B,capacity);
leastNeighborCost=0;
while 1
    acceptNewRoute=0;
    leastNeighborCost=selectLeastCostMoves(bestCostMatrix, leastNeighborCost);
    if leastNeighborCost==0
        break
    end
    [move1 move2]=selectMoves(bestCostList, leastNeighborCost, routes);
    newRoutes=createNewRoutes(routes, bestCostList, leastNeighborCost);
    newCost=totalCost(newRoutes, B);
    if (isTabu(move1, tabuList, iteration)==1||(isTabu(move2, tabuList, iteration)==1))
        if (newCost<bestCost)
            acceptNewRoute=1;
        end
    else
        if (newCost<currentCost)
            acceptNewRoute=1;
        end
    end
    if acceptNewRoute
        routes=newRoutes;
        currentCost=newCost;
        tabuList=updateTabuList(tabuList, move1, move2, tabuListSize, iteration);
        [bestCostMatrix bestCostList]=updateBCs(newRoutes, A, B, capacity, bestCostList(leastNeighborCost,1), bestCostList(leastNeighborCost,2), bestCostMatrix, bestCostList);
        [bestCostMatrix routes]=removeEmptyRoutes(bestCostMatrix, routes);
        if currentCost<bestCost
            bestRoutes=routes;
            bestCost=currentCost;
        end
    end
    iteration=iteration+1;
    [m,n]=size(routes);
    [j,k]=size(tabuList);
    if iteration>m*k*10
        break
    end
end
bestCost=bestCost
bestRoutes=removeZeros(bestRoutes)
    