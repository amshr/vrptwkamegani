function newRoute=normalize(route)

newRoute=[]
[n,m]=size(route);

for i=1:m
    if (route(i)~=0)
        newRoute=[newRoute route(i)];
    end
end
