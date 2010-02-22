function isFeasible = checkFeasibility(A, B, route, capacity)
    [m,n]=size(route);
    isFeasible=1;
    
    if n>0

        %check for capacity
        load=0;
        for i=1:n
            load=load+A(route(i),3);
        end
        if load>capacity
            isFeasible = 0;
            return
        end

        %check for time

        %Time to go to first client
        u=B(1,route(1)+1);
        if (A(route(1),4)>u)
            t=A(route(1),4);
        elseif(A(route(1),5)<u)
            isFeasible = 0;
            return
        else
            t=u;
        end

        %Time to visit all the other clients
        for l=1:n-1
            u=t+B(route(l)+1,route(l+1)+1)+A(route(l),6);
            if(A(route(l+1),4)>u)
                t=A(route(l+1),4);
            elseif(A(route(l+1),5)<u)
                isFeasible = 0;
                return
            else
                t=u;
            end
        end
        
    end
