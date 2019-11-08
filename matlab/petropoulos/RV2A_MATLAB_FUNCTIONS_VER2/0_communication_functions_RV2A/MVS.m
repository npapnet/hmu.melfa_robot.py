function MVS(nop)     %number of point (STRING)
        cmd=['1;1;EXECMVS ' nop];
        SendCmd(cmd);
end