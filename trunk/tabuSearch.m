function bestRoutes=tabuSearch(A, capacity)

stream=RandStream('mrg32k3a');

B=disttab(A);
routes=PFIH(A, B);
routes=twoInterchange(routes, A, B, capacity);
currentCost=totalCost(routes, B);
tabuListSize=10;
tabuList=[];
bestRoutes=routes;
bestCost=totalCost(bestRoutes, B);
iteration=0;
maximumTemperature=50;
currentTemperature=maximumTemperature;
finalTemperature=0;
resetTemperature=maximumTemperature;
bestSolutionTemperature=50;
resets=3;
coolingFactor=0.5;
[bestCostMatrix bestCostList]=createBCs(routes,A,B,capacity)
leastNeighborCost=0;
emptyRoutes=[];
while 1
    acceptNewRoute=0;
    leastNeighborCost=selectLeastCostMoves(bestCostMatrix, leastNeighborCost);
    if leastNeighborCost==0
        break
    end
    [move1 move2]=selectMoves(bestCostList, leastNeighborCost, routes);
    newRoutes=createNewRoutes(routes, bestCostList, leastNeighborCost);
    newCost=totalCost(newRoutes, B);
    if (isTabu(move1, tabuList)||(isTabu(move2, tabuList)))
        if (newCost<bestCost)
            acceptNewRoute=1;
        end
    else
        if (newCost<currentCost)
            acceptNewRoute=1;
        else
            randTemp=rand(stream,1,1);
            delta=newCost-currentCost;
            if randTemp<=exp((0-delta)/currentTemperature);
                acceptNewRoute=1;
            end
        end
    end
    if acceptNewRoute
        routes=newRoutes
        currentCost=newCost;
        currentTemperature=currentTemperature/(1+coolingFactor*currentTemperature);
        tabuList=updateTabuList(tabuList, move1, move2, tabuListSize, iteration);
        [bestCostMatrix bestCostList]=updateBCs(newRoutes, A, B, capacity, bestCostList(leastNeighborCost,1), bestCostList(leastNeighborCost,2), bestCostMatrix, bestCostList);
        newEmptyRoutes=checkForEmptyRoutes(newRoutes, emptyRoutes);
        bestCostMatrix=removeEmptyRoutes(newEmptyRoutes, bestCostMatrix);
        if currentCost<bestCost
            bestRoutes=routes;
            bestCost=currentCost;
            bestSolutionTemperature=currentTemperature;
        end
        [m,n]=size(routes);
        [j,k]=size(tabuList);
        if currentTemperature==finalTemperature;
            break
        end
    else
        resetTemperature=max(bestSolutionTemperature, resetTemperature/2);
        resets=resets-1;
        if resets==0
            break
        end
    end
    iteration=iteration+1;
    if iteration>m*k
        break
    end
    emptyRoutes=[emptyRoutes newEmptyRoutes];
end
bestRoutes=removeZeros(bestRoutes);
    