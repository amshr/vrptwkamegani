function check=isTimeFactible(A, B, list, i, j)
%Checks whether adding element j to the list at position i doesn't make the
%subsequent clients' time windows infeasible.

check=1;

%Time to go to first client
u=B(1,list(1)+1);
if (A(list(1),4)>u)
    t=A(list(1),4);
else
    t=u;
end
  
%Time to visit all the clients, until i-1
for l=1:i-2
    u=t+B(list(l)+1,list(l+1)+1)+A(list(l),6);
    if(A(list(l),4)>u)
        t=A(list(l),4);
    else
        t=u;
    end
end
t=t+A(list(i-1),6);


%Time to visit all the clients until i-1, plus j, checking feasibility for j
u=t+B(list(i-1)+1,j+1);
if (A(j,4)>u)
    t=A(j,4);
else if (A(j,5)<u)
        check=0;
        return
    else
        t=u;
    end
end
t=t+A(j,6);

%Checking feasibility for subsequent clients
[n,m]=size(list);

if (m+1>i)
    %Checking for i
    u=t+B(j+1, list(i)+1);
    if(A(list(i),4)>u)
        t=A(list(i));
    else if (A(list(i),5)<u)
            check=0;
            return
        else
        t=u;
        end
    end
    t=t+A(list(i),6);
    
    %Checking for next ones
    for l=i+1:m
        u=t+B(list(l-1)+1,list(l)+1);
        if(A(list(l),4)>u)
            t=A(list(l));
        else if (A(list(l),5)<u)
                check=0;
                return
            else
            t=u;
            end
        end
        t=t+A(list(l,6));
    end
end