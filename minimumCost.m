function cost=minimumCost(A, B)
%Returns a list with the cost to add each client as first.

alfa = 0.7;
beta = 0.1;
gama = 0.2;

[n,m] = size(A);

for i=1:n
    if (A(i, 1) == 0)
        a = 90;
    else
        a = rad2deg(atan(A(i,2)/A(i,1)));
    end
    cost(1,i) = -alfa*B(1, i) + beta*A(i, 5) + gama*((pi/360)*a);
    cost(2,i) = i;
end