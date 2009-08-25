function empty=checkForEmptyRoutes(routes, emptyRoutes)
%Removes zeros from a matrix of routes.


[n,m]=size(routes);
[u,v]=size(emptyRoutes);
empty=[];
emptyRoutes=emptyRoutes
for i=1:n
    flag=1;
    if routes(i,1)==0
        for j=1:v
            if i==emptyRoutes(j)
                flag=0;
            end
        end
        if flag==1
            empty=[empty i]
        end
    end
end