function cost=totalCost(routes, disttabel)

[n,m]=size(routes);
cost=0;
for i=1:n
    route=normalize(routes(i,:));
    [row, col]=size(route);
    if (col>0)
        if (col<2)||(not((route(1)==0)&&(route(2)==1)))
            cost=cost+disttabel(1,route(1)+1);
            for j=1:col-1
                cost=cost+disttabel(route(j)+1,route(j+1)+1);
            end
            cost=cost+disttabel(route(col)+1,1);
        end
    end
end