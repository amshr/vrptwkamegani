function overload=totalOverload(route, A, capacity)

[n,m]=size(route);
load=0;
for i=1:m
	load=load+A(i,3);
end
overload=load-capacity;
if(overload<0)
	overload=0;
end