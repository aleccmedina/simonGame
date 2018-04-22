%% Response

function [correct]=Response(a,seq)
    correct=1;
    
    for i = 1:length(seq)
       if seq(i)==1
           ppin='D8';
           apin='A0';
           other1='A2';
           other2='A4';
           other3='A6';
       elseif seq(i)==2
           ppin='D6';
           apin='A2';
           other1='A0';
           other2='A4';
           other3='A6';
       elseif seq(i)==3
           ppin='D4';
           apin='A4';
           other1='A0';
           other2='A2';
           other3='A6';
       else
           ppin='D2';
           apin='A6';
           other1='A0';
           other2='A2';
           other3='A4';
       end
       gotIt=0;
       tic
       while (toc<5)&&gotIt==0
           if AtoDRead(a,apin)==1
               gotIt=1;
               writePWMVoltage(a,ppin,5);
               pause(.1)
               writePWMVoltage(a,ppin,0);
           elseif AtoDRead(a,other1)==1||AtoDRead(a,other2)==1||AtoDRead(a,other3)==1
               fprintf('%.0f\t%.0f\t%.0f\t%.0f\n',AtoDRead(a,other1),AtoDRead(a,other2),AtoDRead(a,other3),AtoDRead(a,apin));
               fprintf('%s\t%s\t%s\t%s\n',other1,other2,other3,apin);
               break;
           end
       end
       if gotIt==0
           correct=0;
           break;
       end
       pause(.2);
    end
end