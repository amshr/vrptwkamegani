function [move1 move2]=selectMoves(bestCostList, leastNeighborCost, routes)

route1=bestCostList(leastNeighborCost,1);
route2=bestCostList(leastNeighborCost,2);
posAtRoute1=bestCostList(leastNeighborCost,3);
numberFromRoute1=bestCostList(leastNeighborCost,5);
elementsFromRoute1=[];
for i=0:numberFromRoute1-1
    elementsFromRoute1(i+1)=routes(route1,posAtRoute1+i);
end
posAtRoute2=bestCostList(leastNeighborCost,4);
numberFromRoute2=bestCostList(leastNeighborCost,6);
elementsFromRoute2=[];
for i=0:numberFromRoute2-1
    elementsFromRoute2(i+1)=routes(route2,posAtRoute2+i);
end

move1=[route2 elementsFromRoute1];
move2=[route1 elementsFromRoute2];
