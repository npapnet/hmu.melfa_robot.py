%SET JOG SPEED %
function ex=JOVRD(jovrd)
      if jovrd>0 && jovrd<=100
      cmd=['1;1;EXECJOVRD ' num2str(jovrd) ];

        reply=SendCmd(cmd);

        ex=strcmp(reply(1:3),'QoK');
      
        
      else
          disp('LATHOS')
      end
end
