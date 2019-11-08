function ex=RSTALRM()

cmd=['1;1;RSTALRM'];

reply=SendCmd(cmd);
ex=strcmp(reply(1:3),'QoK');

end

