function t=totalTravelTime(list, A, B);

[n,m]=size(list);

if m==0
    t=0;
    return
end


%Time to go to first client
u=B(1,list(1));
if (A(list(1),4)>u)
    t=A(list(1),4);
else
    t=u;
end
  
%Time to visit all the clients, until m
for l=1:m-1
    u=t+B(list(l)+1,list(l+1)+1)+A(list(l),6);
    if(A(list(l+1),4)>u)
        t=A(list(l+1),4);
    else
        t=u;
    end
end
t=t+A(list(m),6);

%time to return to the deposit
t=t+B(1,list(m));