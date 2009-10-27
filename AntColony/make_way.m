function [current_route, not_visited, phero]=make_way(capacity, clients, A, B, phero, was_left)

q=1/2;
[m,n]=size(A);
not_visited=[clients];
infeasible=0;
current_route=[];
current_time=0;
current_weight=0;
current_client=0;


[lin_not_vis, col_not_vis]=size(not_visited);

for j=1:m
    start_time=max(current_time+B(current_client+1, j), A(j, 4));
    delta_time=start_time-current_time;
    urgency=A(j, 5)-current_time;
    distance=delta_time*urgency-was_left(j); - ???????????
    distance=max(1,distance);
    distance_table(j)=1/distance;
end

for j=1:m
    rand_num=rand(1);
    if rand_num<q
        for i=1:lin_not_vis
            if current_time+B(current_client+1, not_visited(i)) <= A(not_visited(i), 4)
                j=not_visited(i);
                infeasible = 1;
                break;
            end
        end
        if (infeasible == 0)
            for i=1:lin_not_vis
                if (phero(not_visited(i)+1, current_client+1)*(B(not_visited(i)+1, current_client+1))^beta)<(phero(j+1, current_client+1)*(distance_table(j+1, current_client+1))^beta)&&(current_time+B(current_client+1, not_visited(i)) <= A(not_visited(i), 4))
                    if A(not_visited(i), 3)+current_weight<capacity;
                        j=not_visited(i);
                        column=column+1;
                        current_time=max(current_time+B(current_client+1, not_visited(j)), A(not_visited(j), 4));
                    else
                        j=0;
                        current_weight=0;
                        row=row+1;
                        column=0;
                        current_time=current_time+B(current_client+1, 0);
                    end
                end
            end
        else
            return
        end
    else
        prob_sum=0;
        for i=1:lin_not_vis
            if (current_time+B(current_client+1, not_visited(j)) <= A(not_visited(j), 4))
                probability(not_visited(i))=(phero(current_client+1, not_visited(i)+1)*(distance_table(not_visited(i)+1, current_client+1))^beta);
                prob_sum=prob_sum+probability(not_visited(i));
            else
                probability(not_visited(i))=0;
            end
        end
        for i=1:lin_not_vis
            probability(not_visited(i))=probability(not_visited(i))/prob_sum;
        end
        j=roulette(probability);
        if A(not_visited(j), 3)+current_weight<capacity;
            column=column+1;
            current_time=max(current_time+B(current_client+1, not_visited(j)), A(not_visited(j), 4));
        else
            j=0;
            current_weight=0;
            row=row+1;
            column=0;
            current_time=current_time+B(current_client+1, 0);
        end
        not_visited = removeElement(not_visited, j);
        phero(current_client+1, j+1) = (1-lambda)*phero(current_client+1, j+1)+lambda*tauZero;
        current_client=j;
        if j~=0
            current_route(row, column)=j;
        end
    end
end
    