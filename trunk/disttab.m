function B=disttab(A)

int n;
int i;
int j;
double aux1;
double aux2;
int B;
[n,m] = size(A);
for i=1:n
	for j=i:n
        aux1 = A(i,1) - A(j,1);
        aux2 = A(i,2) - A(j,2); 
        B(i+1,j+1) = sqrt((aux1)^2 + (aux2)^2);
        B(j+1,i+1) = B(i+1,j+1);
	end
end
for i=1:n
	aux1 = A(i,1)^2;
	aux2 = A(i,2)^2;
	B(i+1,1) = sqrt(aux1 + aux2);
	B(1,i+1) = B(i+1,1);
end