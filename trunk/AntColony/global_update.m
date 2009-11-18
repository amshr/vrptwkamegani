function phero=global_update(phero, route, B, lambda)

[m,n]=size(route);
for i=1:m
    for j=1:n-1
        if route(i,j+1)==0;
            phero(route(i,j)+1, 1)=(1-lambda)*phero(route(i,j)+1, 1)+lambda*(1/B(route(i,j)+1, 1));
            break;
        else
            phero(route(i,j)+1, route(i, j+1)+1)=(1-lambda)*phero(route(i,j)+1, route(i, j+1)+1)+lambda*(1/B(route(i,j)+1, route(i, j+1)+1));
        end
        if j+1==n&&route(i,j+1)~=0
            phero(route(i, j+1)+1, 1)=(1-lambda)*phero(route(i, j+1)+1, 1)+lambda*(1/B(route(i, j+1)+1, 1));
        end
    end
    phero(1, route(i, 1)+1)=(1-lambda)*phero(1, route(i, 1)+1)+lambda*(1/B(route(i,1)+1, 1));
end