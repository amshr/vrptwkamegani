function n=look_for_minA(A, column, added_customers)

[m,n]=size(A);
min=intmax;
for i=1:m
    if added_customers(i)==0
        if A(i, column)<min && A(i, column)~=0
            min=i;
        end
    end
end
if min ~= intmax
    n=min;
else
    n=0;
end