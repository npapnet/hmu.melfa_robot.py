% SET interpolition speed mm/sec
% MAX SPEED 3500mm/sec

function ex=SPD(speed)
    cmd=['1;1;EXECSPD ' num2str(speed) ];
    reply=SendCmd(cmd);
    ex=strcmp(reply(1:3),'QoK');
end
