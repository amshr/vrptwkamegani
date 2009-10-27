function phero=global_update(phero, route, B, lambda)

[m,n]=size(route);
for i=1:m
    for j=i:n-1
        if route[i,j+1] ==0;
            phero[route[i,j]+1, 0]=(1-lambda)*phero[route[i,j]+1, 0]+lambda*(1/B[route[i,j]+1, 0]);
            break;
        else
            phero[route[i,j]+1, route[i, j+1]+1]=(1-lambda)*phero[route[i,j]+1, route[i, j+1]+1]+lambda*(1/B[route[i,j]+1, route[i, j+1]+1]);
        end
    end
    phero[route[i, 1]+1, 0]=(1-lambda)*phero[route[i,1]+1, 0]+lambda*(1/B[route[i,1]+1, 0]);
end