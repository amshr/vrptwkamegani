function tardiness=totalTardiness(list, A, B)

tardiness=0;
[n,m]=size(list);

if m==0
    return
end

%Time to go to first client
u=B(1,list(1)+1);
if (A(list(1),4)>u)
    t=A(list(1),4);
else
    t=u;
end
if (A(list(1),5)<u)
	tardiness=u-A(list(1),5)
end

for l=2:m
    u=t+B(list(l-1)+1,list(l)+1)
    if(A(list(l),4)>u)
		t=A(list(l));
	else if (A(list(l),5)<u)
			tardiness=tardiness+u-A(list(l),5);
			t=u;
		else
		t=u;
		end
	end
	t=t+A(list(l),6);
end
