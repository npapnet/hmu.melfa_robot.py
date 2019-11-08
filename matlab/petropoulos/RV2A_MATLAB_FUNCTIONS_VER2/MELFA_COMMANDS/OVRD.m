%SET BASE SPEED %

function ex=OVRD(ovrd)

    if ovrd>0 && ovrd<=100
      cmd=['1;1;EXECOVRD ' num2str(ovrd) ];
        reply=SendCmd(cmd);
        ex=strcmp(reply(1:3),'QoK');
    else
        disp('LATHOS')
    end
end