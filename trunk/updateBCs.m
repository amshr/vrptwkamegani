function [bestCostM bCList]=updateBCs(routes, A, disttab, capacity, route1, route2, bestCostM, bCList)

[n,m]=size(routes);
for i=1:n
    routeSize(i,1)=sizeOfRoute(routes(i,:));
end

changedRoutes = [route1 route2];

%For each pair of routes
for d=1:2
    l=changedRoutes(d);
    for k=1:n
        minimumCost=2^60;
        %For all combinations of 0, 1 and 2, but not (0, 0)
        for i=0:2
            for j=0:2
                if not((i==0)&(j==0))
                    %Define a limit, for you can't remove a element after
                    %the end of the route
                    if i==2
                        limitl=routeSize(l)-1;
                    else
                        limitl=routeSize(l);
                    end
                    if j==2
                        limitk=routeSize(k)-1;
                    else
                        limitk=routeSize(k);
                    end
                    %For each position inside each pair of routes
                    for iPos=1:limitl
                        for jPos=1:limitk
                            elementl = selectElements(normalize(routes(l,:)), iPos, i);
                            elementk = selectElements(normalize(routes(k,:)), jPos, j);
                            newRoutel = normalize(routes(l,:));
                            newRoutek = normalize(routes(k,:));
                            newRoutel = removeElement(newRoutel, iPos, i);
                            newRoutek = removeElement(newRoutek, jPos, j);
                            newRoutel = addAt(newRoutel, elementk, iPos-1);
                            newRoutek = addAt(newRoutek, elementl, jPos-1);
                            costl = checkDCost(routes(l,:), newRoutel, A, disttab, capacity);
                            costk = checkDCost(routes(k,:), newRoutek, A, disttab, capacity);
                            cost = costl+costk;
                            if cost<minimumCost 
                                minimumCost=cost;
                                minElePosL=iPos;
                                minElePosK=jPos;
                                minEleNumL=i;
                                minEleNumK=j;
                            end
                        end
                    end
                end
            end
        end
        if k>l
            bestCostM(l,k)=minimumCost;
            bCList(bestCostM(k,l), 1)=l;
            bCList(bestCostM(k,l), 2)=k;
            bCList(bestCostM(k,l), 3)=minElePosL;
            bCList(bestCostM(k,l), 4)=minElePosK;
            bCList(bestCostM(k,l), 5)=minEleNumL;
            bCList(bestCostM(k,l), 6)=minEleNumK;
        else if k<1
                bestCostM(k,l)=minimumCost;
                bCList(bestCostM(l,k), 1)=l;
                bCList(bestCostM(l,k), 2)=k;
                bCList(bestCostM(l,k), 3)=minElePosL;
                bCList(bestCostM(l,k), 4)=minElePosK;
                bCList(bestCostM(l,k), 5)=minEleNumL;
                bCList(bestCostM(l,k), 6)=minEleNumK;
            end
        end
    end
end
