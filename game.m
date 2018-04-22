%% Main Simon Game Script
clear;clc;close;
a=arduino('COM3','Mega2560');
writePWMVoltage(a,'D10',5);
writePWMVoltage(a,'D8',0);
writePWMVoltage(a,'D6',0);
writePWMVoltage(a,'D4',0);
writePWMVoltage(a,'D2',0);

again=1;
score=0;
previous=0;

while again==1
    fprintf('Starting the Simon Game. Pay attention!\n');
    fprintf('\n');
    pause(3);
    seq=[];
    for skillLevel=1:4
        if skillLevel==1
            fprintf('You reached skill level 1.\n\n');
            for i=1:6
                seq=Blink(a,seq,skillLevel);
                correct=Response(a,seq);
                if correct==0
                    break;
                else
                    pause(.5);
                    score=score+1;
                end
            end
        elseif skillLevel==2
            fprintf('You reached skill level 2.\n\n');
            for i=1:2
                seq=Blink(a,seq,skillLevel);
                correct=Response(a,seq);
                if correct==0
                    break;
                else
                    pause(.5);
                    score=score+1;
                end
            end
        elseif skillLevel==3
            fprintf('You reached skill level 3.\n\n');
            for i=1:4
                seq=Blink(a,seq,skillLevel);
                correct=Response(a,seq);
                if correct==0
                    break;
                else
                    pause(.5);
                    score=score+1;
                end
            end
        else
            fprintf('You reached skill level 4.\n\n');
            for i=1:19
                seq=Blink(a,seq,skillLevel);
                correct=Response(a,seq);
                if correct==0
                    break;
                else
                    pause(.5);
                    score=score+1;
                end
            end 
        end
        if correct==0
            break;
        end
    end
    if correct==0
        fprintf('You lost! Try again next time!\n');
    else
        fprintf('You Won! Awesome!\n');
    end

    fprintf('Your score is %.0f.\n',score);
    if score>previous
        fprintf('New High Score!\n');
        previous=score;
    end
    again=menu('Would you like to try Simon again?','Yes','No');
end
