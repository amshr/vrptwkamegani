function flag=isTabu(move, tabuList)

[rowTL,colTL]=size(tabuList);
[rowM,colM]=size(move);

flag=0;
if colM==1
    flag=0;
    return
end

if colM==2
    for i=1:colTL
        if (tabuList(1,i)==move(2))&&(tabuList(2,i)==move(1))
            flag=1;
            return
        end
    end
else
    move1=[move(1) move(2)];
    move2=[move(1) move(3)];
    flag=(isTabu(move1, tabuList))||(isTabu(move2, tabuList));
end