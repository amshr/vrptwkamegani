function newRoutes=2-interchange(routes)

[n,m]=size(routes);
for i=1:n
    routeSize(i,1)=sizeOfRoute(routes(i,:));
end

for l=1:m
    for k=l+1:m
        for i=0:2
            for j=0:2
                if not((i==0)&(j==0))
                    iPos=1;
                    jPos=1;
                    for iPos=1:routeSize(l)-i+1
                        for jPos=1:routeSize(k)-i+1)
                            %esqueci de remover o elemento da rota
                            %anterior.. melhor mudar isso tudo, senao vai
                            %ficah meio errado
                            elementl=selectElements(iPos, i);
                            elementk=selectElements(jPos, j)
                            newRoutel=createNewRoute(routes(l,:), elementk, i);
                            newRoutek=createNewRoute(routes(k,:), elementl, j);
                            costl=checkDCost(routes(l,:), newRoutel);
                            costk=checkDCost(routes(k,:), newRoutek);
                            cost=cost1+cost2;
                            if (cost<0)
                                sizel=sizeOfRoute(newRoutel);
                                sizek=sizeOfRoute(newRoutek);
                                for h=1:sizel
                                    routes(l,h)=newRoutel(h);
                                end
                                if routeSize(l,1)>sizel
                                    for h=sizel:routeSize(l,1)
                                        routes(l,h)=0;
                                    end
                                end
                                for h=1:sizek
                                    routes(k,h)=newRoutel(h);
                                end
                                if routeSize(k,1)>sizel
                                    for h=sizek:routeSize(k,1)
                                        routes(k,h)=0;
                                    end
                                end
                                return
                            end
                        end
                    end
                end
            end
        end
    end
end
                            
            