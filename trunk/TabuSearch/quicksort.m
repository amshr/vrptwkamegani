function sorted=quicksort(list)
%Sorts a 2xm matrix according to the first line.

[n,m] = size(list);
if (m<=1)
    sorted = list;
else
    lesser = [];
    greater = [];

    pivo = list(1);
    for i=2:m
       if (list(1,i)<pivo)
            lesser = [lesser list(:,i)];
       else
            greater = [greater list(:,i)];
        end
    end
    lesser = quicksort(lesser);
    greater = quicksort (greater);
    sorted = [lesser [pivo; list(2,1)] greater];
end