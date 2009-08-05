function newList=removeElement(list, i)

newList = [];
[n,m] = size(list);
for l=1:i-1
    newList=[newList list(l)];
end
for l=i+1:m
    newList=[newList list(l)];
end