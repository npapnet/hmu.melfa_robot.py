function MOV(nop)     %name of point (STRING)
        cmd=['1;1;EXECMOV ' nop];
        SendCmd(cmd);
end