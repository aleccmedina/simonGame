%% AtoDRead

function [pressed] = AtoDRead(a,pin)
    voltage=readVoltage(a,pin);
    if voltage < .5
        pressed = 1;
    elseif voltage > .5
        pressed = 0;
    end
end
