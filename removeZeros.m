function newMatrix=removeZeros(matrix)
%Removes zeros from a matrix of routes.

pos=1;
[n,m]=size(matrix);

for i=1:n
    if matrix(i,1)~=0
        for j=1:m
            if(matrix(i,j)~=0)
                newMatrix(pos,j)=matrix(i,j);
            end
        end
    pos=pos+1;
    end
end