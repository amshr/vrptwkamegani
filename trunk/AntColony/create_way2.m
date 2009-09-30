function 

q=1/2;
[m,n]=size(A);
not_visited=[clients];
for i=1:antsNumber
    for next_client=1:m
        start_time=max(current_time+B[current_client+1, next_client], A[next_client, 4]);
        delta_time=start_time-current_time;
        urgency=A[next_client, 5]-current_time;
        distance=delta_time*urgency-was_left[next_client];
        distance=max(1,distance);
        distance_table[next_client]=1/distance;
    end
    [lin_not_vis, col_not_vis]=size(not_visited);
    rand_num=rand(1);
    if rand_num<q;
    %tem que checah se o 1 aki eh factivel
    %se nenhum for, retorna o q tem e o que sobrou pra usah a heuristica d insercao
        j=not_visited[1];
        for i=1:col_not_vis
            if (phero[not_visited[i]]*(distance_table[not_visited[i]])^beta)<phero[j]*(distance_table[j])^beta)&&(current_time+B[current_client+1, next_client] <= A[next_client, 4])
                j=not_visited[i];
            end
        end
    else
        prob_sum=0;
        for i=1:col_not_vis
            if (current_time+B[current_client+1, next_client] <= A[next_client, 4])
                probability[not_visited[i]]=(phero[current_client, not_visited[i]]*(distance_table[not_visited[i]])^beta)<phero[j]*(distance_table[j])^beta);
                prob_sum=prob_sum+probability[[not_visited[i]];
            else
                probability[not_visited[i]]=0;
            end
        end
        for i=1:col_not_vis
            probability[not_visited[i]]=probability[not_visited[i]]/prob_sum;
        end
        j=roulette(probability);
    end
    not_visited = removeElement(not_visited, j);
    phero[current_client, j] = (1-lambda)*phero[current_client, j]+lambda*tauZero;
    current_client=j;
    
    