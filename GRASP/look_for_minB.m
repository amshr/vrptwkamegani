function n=look_for_minB(B, column, added_customers, checked_customers)

[m,n]=size(B);
min=intmax;
for i=2:m
    if added_customers(i-1)==0 && checked_customers(i-1)==0
        if B(i, column+1)<min && B(i, column+1)~=0
            min=i-1;
        end
    end
end
if min ~= intmax
    n=min;
else
    n=0;
end