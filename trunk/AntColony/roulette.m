function number=roulette(prob)

number=0;
[m,n]=size(prob);
m=max(m,n);
for i=1:m
    if isnan(prob(i))
        prob(i)=0;
    end
end
prob_acc(1)=prob(1);
for i=2:m
    prob_acc(i)=prob_acc(i-1)+prob(i);
end
for i=1:m
    prob_acc(i)=prob_acc(i)/prob_acc(m);
end
rand_num=rand(1);
if rand_num<=prob_acc(1)
    number=1;
end
for i=2:m
    if (rand_num<=prob_acc(i)) && (rand_num>prob_acc(i-1))
        number=i;
    end
end