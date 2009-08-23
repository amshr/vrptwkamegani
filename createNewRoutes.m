function newRoutes=createNewRoutes(routes, bestCostList, leastNeighborCost)
route1=bestCostList(leastNeighborCost,1);
route2=bestCostList(leastNeighborCost,2);
posAt1=bestCostList(leastNeighborCost,3);
posAt2=bestCostList(leastNeighborCost,4);
numberFrom1=bestCostList(leastNeighborCost,5);
numberFrom2=bestCostList(leastNeighborCost,6);
elementsFrom1=selectElements(routes(route1,:),posAt1,numberFrom1);
elementsFrom2=selectElements(routes(route2,:),posAt2,numberFrom2);


newRoute1 = normalize(routes(route1,:));
newRoute2 = normalize(routes(route2,:));
newRoute1 = removeElement(newRoute1, posAt1, numberFrom1);
newRoute2 = removeElement(newRoute2, posAt2, numberFrom2);
newRoute1 = addAt(newRoute1, elementsFrom2, posAt1-1);
newRoute2 = addAt(newRoute2, elementsFrom1, posAt2-1);

[n,m]=size(routes);
[row1, col1]=size(newRoute1);
[row2, col2]=size(newRoute2);
for h=1:col1
    routes(route1,h)=newRoute1(h);
end
for h=col1+1:m
    routes(route1,h)=0;
end
for h=1:col2
    routes(route2,h)=newRoute2(h);
end
for h=col2+1:m
    routes(route2,h)=0;
end
newRoutes=routes;