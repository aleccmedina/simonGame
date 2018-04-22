%% Blink
function [seq]=Blink(a,seq,skillLevel)
    seq=[seq,randi([1,4])];

    if skillLevel==1
        time=1;
    elseif skillLevel==2
        time=.8;
    elseif skillLevel==3
        time=.6;
    elseif skillLevel==4
        time=.4;
    end

    for i=1:length(seq)
       if seq(i)==1
           writePWMVoltage(a,'D8',5);
           pause(time)
           writePWMVoltage(a,'D8',0);
       elseif seq(i)==2
           writePWMVoltage(a,'D6',5);
           pause(time)
           writePWMVoltage(a,'D6',0);
       elseif seq(i)==3
           writePWMVoltage(a,'D4',5);
           pause(time)
           writePWMVoltage(a,'D4',0);
       else
           writePWMVoltage(a,'D2',5);
           pause(time)
           writePWMVoltage(a,'D2',0);
       end
       pause(.5)
    end

end