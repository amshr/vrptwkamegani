function routes=vns(A, capacity)

    B=disttab(A);
    routes=PFIH(A,B,capacity);
    notImp=3;
    prcost=0
    while notImp<=5
        k=1;
        while k<=3
            if k==1
                [routes1 impr]=randTwoInterchange(routes, A, B, capacity, 1);
            end
            if k==2
                [routes1 impr]=randTwopt(A, B, routes, capacity, 1);
            end
            if k==3
                [routes1 impr]=randCrossExchange(A, B, routes, capacity, 1);
            end
            [routes2 impr cost]=innerVns(routes1, A, B, capacity);
            if round(prcost)==round(cost)
                impr=0;
            else
                prcost=cost;
            end
            if impr==1
                routes=routes2;
                k=1;
            else
                k=k+1;
            end
            k
        end
        if impr==0
            notImp=notImp+1
        end
    end
    