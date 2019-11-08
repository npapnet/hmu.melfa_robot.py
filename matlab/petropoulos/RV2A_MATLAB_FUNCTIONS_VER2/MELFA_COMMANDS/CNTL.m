%CONTROL STATE FOR COMMUNICATION

function ex=CNTL(CONTROLSTATE)   %CONTROLSTATE 'ON' 'OFF' 1 0
    if CONTROLSTATE==1
        CONTROLSTATE='ON';
    elseif CONTROLSTATE==0
            CONTROLSTATE='OFF';
    end
      cmd=['1;1;CNTL' CONTROLSTATE ];
      
        reply=SendCmd(cmd);
        ex=strcmp(reply(1:3),'QoK');
end
