function distance=totalDistance(route, disttab, truck_value)

%truck_value=0;
[n,m]=size(route);

if m==0
    distance=0;
    return
end

distance=disttab(1,route(1)+1);
for i=1:m-1
	distance=distance+disttab(route(i)+1,route(i+1)+1);
end
distance=distance+disttab(route(m)+1,1);
distance = 50*n*truck_value + distance;