function empty=checkForEmptyRoutes(routes, emptyRoutes)
%Removes zeros from a matrix of routes.


[n,m]=size(routes);
[u,v]=size(emptyRoutes);
empty=[];
for i=1:n
    if routes(i,1)==0
        flag=1;
        for j=1:v
            if i==emptyRoutes(1,v)
                flag=0;
            end
        end
        if flag
            empty=[empty i]
        end
    end
end