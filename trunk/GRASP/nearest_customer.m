function route=nearest_customer(A, B, capacity)


[m, n]=size(A);
added_customers=zeros(m, 1);
truck=1;
n=look_for_minA(A, 5, added_customers);

route(truck, 1)=n;
last_customer=n;



added_customers(n)=1;
not_done=1;
while not_done
    checked_customers=zeros(m, 1);
    creating_route=[];
    for i=1:m-truck
        if i==1
            n=look_for_minA(A, 5, added_customers);
        else
            n=look_for_minB(B, last_customer, added_customers, checked_customers);
        end
        if n~=0
            newRoute=[creating_route, n];
            if checkFeasibility(A, B, newRoute, capacity)
                creating_route=newRoute
                last_customer=n;
                added_customers(n)=1;
            else
                checked_customers(n)=1;
            end
        end
    end
    truck=truck+1;
    not_done=0;
    for j=1:m
        if added_customers(j)==0
            not_done=1;
            break
        end
    end
    [r,c]=size(creating_route);
    for j=1:c
        route(truck,j)=creating_route(j);
    end
    route
end
