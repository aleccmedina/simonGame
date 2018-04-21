clc;close;clear;

skillLevel=1;
gameOver=0;
while gameOver==0
    if skillLevel==1
        seq=[];
        won=0;
        wrong=0;
        Blink([2, 1, 3]);
    end
    gameOver=1;
end

%%
clc;
seq=Blink(a,[1 2 3 2 3 1 4],4);
yes=Response(a,seq);