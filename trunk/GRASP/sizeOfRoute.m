function length=sizeOfRoute(route)

[n,m]=size(route);
for i=1:m
    if (route(i)==0)
        length = i-1;
        return
    end
end
length=m;