function size=sizeOfRoute(route)

i=1;
while (route(i)~=0)
    i++;
end
size=i-1;