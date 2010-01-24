function numbers=left_update(numbers, clients);

[m,n]=size(clients);
for i=1:m
    numbers(clients(i),1)=numbers(clients(i),1)+1;
end