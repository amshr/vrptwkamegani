function [current_route, not_visited, phero]=make_way(capacity, clients, A, B, phero, was_left)

q=1/2;
[m,n]=size(A);
not_visited=clients;
current_route=[];
current_time=0;
current_weight=0;
current_client=0;
beta=0.5;
column=0;
row=1;
lambda=0.5;
tauZero=0.5;


for l=1:m
    for k=1:m
        start_time=max(current_time+B(current_client+1, k), A(k, 4));
        delta_time=start_time-current_time;
        urgency=A(k, 5)-current_time;
        distance=delta_time*urgency-was_left(k);
        distance=max(1,distance);
        distance_table(k)=1/distance;
    end
    [lin_not_vis, col_not_vis]=size(not_visited);
    rand_num=rand(1);
    if rand_num<q
        infeasible=0;
        for i=1:col_not_vis
            if current_time+B(current_client+1, not_visited(i)) <= A(not_visited(i), 5)
                not_visited(i)
                j=not_visited(i);
                pos=i;
                infeasible = 1;
                break;
            end
        end
        if (infeasible == 1)
            for i=1:col_not_vis
                if (phero(not_visited(i)+1, current_client+1)*(distance_table(i))^beta)<(phero(j+1, current_client+1)*(distance_table(j))^beta)
                    if (current_time+B(current_client+1, not_visited(i)) <= A(not_visited(i), 5))
                        j=not_visited(i);
                        pos=i;
                    end
                end
            end
            if A(j, 3)+current_weight>capacity;
                current_weight=0;
                row=row+1;
                column=0;
                current_time=current_time+B(current_client+1, 1);
            end
            if j~=0
                column=column+1;
                current_time=max(current_time+B(current_client+1, j), A(j, 4));
                current_weight=current_weight+A(j, 3);
                not_visited = removeElement(not_visited, pos, 1);
                phero(current_client+1, j+1) = (1-lambda)*phero(current_client+1, j+1)+lambda*tauZero;
                current_client=j;
            end
        else
            return
        end
    else
        prob_sum=0;
        [lin_not_vis, col_not_vis]=size(not_visited);
        for i=1:col_not_vis
            probability=[];
            if (current_time+B(current_client+1, not_visited(i)+1) <= A(not_visited(i), 5))
                probability(i)=(phero(current_client+1, not_visited(i)+1)*(distance_table(not_visited(i)))^beta);
                prob_sum=prob_sum+probability(i);
            else
                probability(not_visited(i))=0;
            end
        end
        ele=roulette(probability);
        if (ele==0)
            j=0;
            current_weight=0;
            row=row+1;
            column=0;
            current_time=current_time+B(current_client+1, 1);
            current_client=j;
        else
            j=not_visited(ele);
            if A(j, 3)+current_weight>capacity;
                j=0;
                current_weight=0;
                row=row+1;
                column=0;
                current_time=current_time+B(current_client+1, 1);
                current_client=j;
            else
                column=column+1;
                current_time=max(current_time+B(current_client+1, j), A(j, 4));
                current_weight=current_weight+A(j, 3);
                not_visited = removeElement(not_visited, ele, 1);
                phero(current_client+1, j+1) = (1-lambda)*phero(current_client+1, j+1)+lambda*tauZero;
                current_client=j;
            end
        end
    end
    if j~=0
           current_route(row, column)=j
           not_visited=not_visited
    end
end
    