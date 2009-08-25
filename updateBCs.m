function [bestCostM bCList]=updateBCs(routes, A, disttab, capacity, route1, route2, bestCostM, bCList)

[n,m]=size(routes);

for i=1:n
    routeSize(i,1)=sizeOfRoute(routes(i,:));
end

changedRoutes = [route1 route2];

for d=1:2
    l=changedRoutes(d);
    emptyLine=0;
    fixL=0;
    for e=1:l
        if routes(e,1)==0
            fixL=fixL+1;
        end
    end
    for k=1:n
        if routes(k,1)==0
            emptyLine=emptyLine+1;
        else
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
            if k-emptyLine>l-fixL
                bestCostM(l-fixL,k-emptyLine)=minimumCost;
                bCList(bestCostM(k-emptyLine,l-fixL), 1)=l;
                bCList(bestCostM(k-emptyLine,l-fixL), 2)=k;
                bCList(bestCostM(k-emptyLine,l-fixL), 3)=minElePosL;
                bCList(bestCostM(k-emptyLine,l-fixL), 4)=minElePosK;
                bCList(bestCostM(k-emptyLine,l-fixL), 5)=minEleNumL;
                bCList(bestCostM(k-emptyLine,l-fixL), 6)=minEleNumK;
                bCList(bestCostM(k-emptyLine,l-fixL), 7)=minimumCost;
            else if k-emptyLine<l-fixL
                    bestCostM(k-emptyLine,l-fixL)=minimumCost;
                    bCList(bestCostM(l-fixL,k-emptyLine), 1)=l;
                    bCList(bestCostM(l-fixL,k-emptyLine), 2)=k;
                    bCList(bestCostM(l-fixL,k-emptyLine), 3)=minElePosL;
                    bCList(bestCostM(l-fixL,k-emptyLine), 4)=minElePosK;
                    bCList(bestCostM(l-fixL,k-emptyLine), 5)=minEleNumL;
                    bCList(bestCostM(l-fixL,k-emptyLine), 6)=minEleNumK;
                    bCList(bestCostM(l-fixL,k-emptyLine), 7)=minimumCost;
                end
            end
        end
    end
end
