function leastCostMove=selectLeastCostMoves(lcMatrix, lastLeast)
[n,m]=size(lcMatrix);
if n==1||n==0
    leastCostMove=0;
    return
end

leastCost=lcMatrix(1,2);
leastCostMove=lcMatrix(2,1);
for i=1:n
    for j=i+1:m
        if (lcMatrix(i,j)<leastCost)&&(lcMatrix(j,i)~=lastLeast)
            leastCost=lcMatrix(i,j);
            leastCostMove=lcMatrix(j,i);
        end
    end
end

        