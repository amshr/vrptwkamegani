function deltaCost=checkDCost(originalRoute, newRoute, A, disttab, capacity)

originalRoute=normalize(originalRoute);
newRoute=normalize(newRoute);

originalDistance=totalDistance(originalRoute, disttab);
newDistance=totalDistance(newRoute, disttab);
originalTravelTime=totalTravelTime(originalRoute, A, disttab);
newTravelTime=totalTravelTime(newRoute, A, disttab);
originalOverload=totalOverload(originalRoute, A, capacity);
newOverload=totalOverload(newRoute, A, capacity);
originalTardiness=totalTardiness(originalRoute, A, disttab);
newTardiness=totalTardiness(newRoute, A, disttab);
originalCost=originalTravelTime;
newCost=newTravelTime;
deltaCost=newCost-originalCost;
