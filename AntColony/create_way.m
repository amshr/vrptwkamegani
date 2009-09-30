function way=create_way(pheromone_count, capacity, A)

[m,n]=size(pheromone_count);
way=[];
used_capacity=0;
way_line=1;

for i=1:n
	roulette=[];
	roulette[1,i]=0;
	roulette[2,i]=0;
	for i=1:n+2-i
		roulette[1,i] = roulette[1,i-1] + pheromone_count[1];
		roulette[2,i] = i;
	end
	pick=rand(1)*roulette[1,n+1-i];
	for i=1:n+1-i
		if (pick>roulette[1,i] && pick<=roulette[1,i+1] )
			pick=roulette[2,i+1];
			break;
		end
	end
	
	used_capacity=used_capacity+A[pick, 3];
	if (used_capacity>capacity)
		way_line=+1;
		used_capacity=A[pick, 3];
	end
	pheromone_count=remove_element(pheromone_count, pick);
	way[way_line,:] = [way[way_line,:] pick];
end