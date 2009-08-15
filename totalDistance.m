function distance=totalDistance(route, disttab)

[n,m]=size(route);

distance=disttab(1,route(1));
for i=1:m-1
	distance=distance+disttab(route(i),route(i+1));
end
distance=distance+disttab(route(m),1);