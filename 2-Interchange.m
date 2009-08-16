function newRoutes=twoInterchange(routes, A, disttab, capacity)

[n,m]=size(routes);
for i=1:n
    routeSize(i,1)=sizeOfRoute(routes(i,:))
end

%For each pair of routes
for l=1:n
    for k=l+1:n
        %For all combinations of 0, 1 and 2, but not (0, 0)
        for i=0:2
            for j=0:2
                if not((i==0)&(j==0))
                    %For each position inside each pair of routes
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
                    for iPos=1:limitl
                        for jPos=1:limitk
                            elementl=selectElements(normalize(routes(l,:)), iPos, i)
                            elementk=selectElements(normalize(routes(k,:)), jPos, j)
                            newRoutel=normalize(routes(l,:))
                            newRoutek=normalize(routes(k,:))
                            newRoutel=removeElement(newRoutel, iPos, i)
                            newRoutek=removeElement(newRoutek, jPos, j)
                            newRoutel=addAt(newRoutel, elementk, iPos-1)
                            newRoutek=addAt(newRoutek, elementl, jPos-1)
                            costl=checkDCost(routes(l,:), newRoutel, A, disttab, capacity)
                            costk=checkDCost(routes(k,:), newRoutek, A, disttab, capacity)
                            cost=costl+costk
                            if (cost<0)
                                [rowl, sizel]=size(newRoutel);
                                [rowk, sizek]=size(newRoutek);
                                for h=1:sizel
                                    routes(l,h)=newRoutel(h);
                                end
                                if routeSize(l,1)>sizel
                                    for h=sizel+1:routeSize(l)
                                        routes(l,h)=0;
                                    end
                                end
                                for h=1:sizek
                                    routes(k,h)=newRoutek(h);
                                end
                                if routeSize(k,1)>sizek
                                    for h=sizek+1:routeSize(k)
                                        routes(k,h)=0;
                                    end
                                end
                                newRoutes=removeZeros(routes);
                                return
                            end
                        end
                    end
                end
            end
        end
    end
end
newRoutes=removeZeros(routes);