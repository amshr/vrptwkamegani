function [newRoutes improvement]=randCrossExchange(A, B, routes, capacity, a)

improvement=0;
[m,n]=size(routes);
originalRoutes=routes;
if m>1
    for i=randi(m-1):m-1
        for j=randi(m-i)+i+1:m
            routi=normalize(routes(i,:));
            routj=normalize(routes(j,:));
            [im, in]=size(routi);
            [jm, jn]=size(routj);
            for edgei1=randi(in):in
                for edgei2=randi(in):in
                    pieceToExchangeI=[];
                    for between=edgei1:edgei2
                        pieceToExchangeI=[pieceToExchangeI, routes(i, between)];
                    end
                    for edgej1=randi(jn):jn
                        for edgej2=randi(jn):jn
                            if not((edgei1==1)&&(edgei2==in)&&(edgej1==1)&&(edgej2==jn))
                                newRouteI2=[];
                                newRouteJ2=[];
                                pieceToExchangeJ=[];
                                for between=edgej1:edgej2
                                    pieceToExchangeJ=[pieceToExchangeJ, routes(j, between)];
                                end
                                for joining=1:edgei1-1
                                    newRouteI2(joining)=routes(i, joining);
                                end
                                for joining=1:edgej2-edgej1+1
                                    newRouteI2=[newRouteI2, pieceToExchangeJ(joining)];
                                end
                                for joining=edgei2+1:in
                                    newRouteI2=[newRouteI2, routes(i, joining)];
                                end
                                for joining=1:edgej1-1
                                    newRouteJ2(joining)=routes(j, joining);
                                end
                                for joining=1:edgei2-edgei1+1
                                    newRouteJ2=[newRouteJ2, pieceToExchangeI(joining)];
                                end
                                for joining=edgej2+1:jn
                                    newRouteJ2=[newRouteJ2, routes(j, joining)];
                                end
                                if checkFeasibility(A, B, newRouteJ2, capacity)&&checkFeasibility(A, B, newRouteI2, capacity)
                                    [mi, ni]=size(newRouteI2);
                                    for p=1:in
                                          routes(i,p)=0;
                                    end
                                    for p=1:ni
                                          routes(i,p)=newRouteI2(p);
                                    end
                                    [mj, nj]=size(newRouteJ2);
                                    for p=1:jn
                                          routes(j,p)=0;
                                    end
                                    for p=1:nj
                                          routes(j,p)=newRouteJ2(p);
                                    end
                                    newRoutes=routes;
                                    improvement=1;
                                    routes=originalRoutes;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
if a>30
    newRoutes=routes;
    return 
end
if improvement==0
    [newRoutes improvement]=randCrossExchange(A, B, routes, capacity, a+1);
end