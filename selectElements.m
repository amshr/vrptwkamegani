function elements=selectElements(list, i, n);
%returns n subsequent elements from the list, starting from the one at position i.

elements = [];
for j=i:i+n
    elements=[elements list(j)]
end