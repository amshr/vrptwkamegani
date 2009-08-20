function [bestCostM bCList]=createBCs(routes, A, disttab, capacity)

[n,m]=size(routes);
for i=1:n
    routeSize(i,1)=sizeOfRoute(routes(i,:));
end

bCListRow=1;

%For each pair of routes
for l=1:n
    for k=l+1:n
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
        bestCostM(l,k)=minimumCost;
        bestCostM(k,l)=bCListRow;
        bCList(bCListRow, 1)=l;
        bCList(bCListRow, 2)=k;
        bCList(bCListRow, 3)=minElePosL;
        bCList(bCListRow, 4)=minElePosK;
        bCList(bCListRow, 5)=minEleNumL;
        bCList(bCListRow, 6)=minEleNumK;
        bCList(bCListRow, 7)=minimumCost;
        bCListRow = bCListRow + 1;
    end
end
