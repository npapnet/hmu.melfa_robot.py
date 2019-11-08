%STOP execution
function ex=STOP()
    cmd=['1;1;STOP'];
    reply=SendCmd(cmd);
    ex=strcmp(reply(1:3),'QoK');
end