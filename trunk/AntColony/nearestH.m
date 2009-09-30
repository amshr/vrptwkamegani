function trucks=nearestH(A, B, max_capacity);

[m,n]=size[A];
routes=[];
routes_line=1;

past_element=0;
for i=0:m
    for j=1:m
        if (B[past_element+1,j]<B[past_element+1,element] && B[past_element+1,j] ~= 0)
            element=i;
        end
    capacity=capacity+A[element,3];
    if capacity>max_capacity
        capacity=A[element,3];
        routes_line=routes_line+1;
    end
    routes[routes_line,:]=[routes[routes_line,:] element];
    past_element=element;
end
[m,n]=size[routes];
trucks=m;