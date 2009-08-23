function newTabuList=updateTabuList(tabuList, move1, move2, tabuListSize, iteration)

[rows1 cols1]=size(move1);
[rows2 cols2]=size(move2);

if cols1~=1
    if cols1==2
        toAdd(1,1)=move1(2);
        toAdd(2,1)=move1(1);
        toAdd(3,1)=iteration+tabuListSize;
        tabuList=[tabuList toAdd];
    else
        move11=[move1(1) move1(2)];
        move12=[move1(1) move1(3)];
        tabuList=updateTabuList(tabuList, move11, move12, tabuListSize, iteration);
    end
end

if cols2~=1
    if cols2==2
        toAdd(1,1)=move2(2);
        toAdd(2,1)=move2(1);
        toAdd(3,1)=iteration+tabuListSize;
        tabuList=[tabuList toAdd];
    else
        move21=[move2(1) move2(2)];
        move22=[move2(1) move2(3)];
        tabuList=updateTabuList(tabuList, move21, move22, tabuListSize, iteration);
    end
end

startFrom=0;
[rowsTL colsTL]=size(tabuList);
for i=1:colsTL
    if (tabuList(3)>iteration)
        startFrom=i;
        break
    end
end
if startFrom>1
    for i=startFrom:colsTL
        newTabuList=tabuList(i);
    end
else
    newTabuList=tabuList;
end