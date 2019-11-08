%SETJOINTSVAL('J1',[0 0 90 0 0 0])
function ex=SETJOINTSVAL(nop,J)

if (nop(1)=='J' && length(nop)>1)
    if isnumeric(J)
      cmd=['1;1;EXEC ' nop ' = ('...
          num2str(J(1),'%10.3f') ', '...
          num2str(J(2),'%10.3f') ', ' num2str(J(3),'%10.3f') ', '...
          num2str(J(4),'%10.3f') ', ' num2str(J(5),'%10.3f') ', '...
          num2str(J(6),'%10.3f') ')'];
    elseif strcmp(J,'current')
            cmd=['1;1;EXEC' nop '=J_CURR'];
    end
      reply=SendCmd(cmd);
      ex=strcmp(reply(1:3),'QoK');
else 
    disp('-------------------------------------------------------------------------')
    disp('LATHOS ONOMA METAVLHTHS, H METAVLHTH PREPEI NA KSKINAEI ME TO GRAMMA >J< KAI NA AKOLOUTHEI ARITHMOS I GRAMMA')
    disp('-------------------------------------------------------------------------')
end
    
end