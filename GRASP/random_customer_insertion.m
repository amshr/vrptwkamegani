function routes=random_customer_insertion(A, B, capacity)

[m,n]=size(A);
for i = 1:m
    customers(i)=i;
end
unrouted_customers=m;

routes=[];
number_of_routes=0;

newRoute=[];
while unrouted_customers>0
    added=0;
    c=randi(unrouted_customers,1);
    customer=customers(c);
    if number_of_routes>0
        r=randi(number_of_routes, 1);
        %try to insert the random customer in a route, starting at the random r
        for j=r:number_of_routes
            [newRoute added]=addToRoute(customer, routes(j,:), A, B, capacity);
            if added==1
                customers=removeElement(customers, c, 1);
                unrouted_customers=unrouted_customers-1;
                row=j;
                break
            end
        end
        %if not succesful, try the first ones, up to r-1
        if added==0
            for j=1:r-1
                [newRoute, added]=addToRoute(customer, routes(j,:), A, B, capacity);
                if added==1
                    customers=removeElement(customers, c, 1);
                    unrouted_customers=unrouted_customers-1;
                    row=j;
                    break
                end
            end
        end
    end
    %if it's still not inserted, create a new route for it
    if added==0
        number_of_routes=number_of_routes+1;
        newRoute=customer;
        row=number_of_routes;
        customers=removeElement(customers, c, 1);
        unrouted_customers=unrouted_customers-1;
    end
    %Copy the new route to Routes
    [s,t]=size(newRoute);
    for j=1:t
        routes(row, j)=newRoute(j);
    end
end