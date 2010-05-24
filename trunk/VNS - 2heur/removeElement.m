function newList=removeElement(list, i, n)
%Removes n elements starting at position i.

newList = [];
[k,m] = size(list);
for l=1:i-1
    newList=[newList list(l)];
end
for l=i+n:m
    newList=[newList list(l)];
end