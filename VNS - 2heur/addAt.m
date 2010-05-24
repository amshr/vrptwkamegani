function newRoute=addAt(route, newElement, i)
%Adds an element after position i in an existent route, pushing forward all
%the next elements.

newRoute=[];
[n,m] = size(route);
for l=1:i
    newRoute = [newRoute route(l)];
end
newRoute = [newRoute newElement];
for l=i+1:m
    newRoute = [newRoute route(l)];
end