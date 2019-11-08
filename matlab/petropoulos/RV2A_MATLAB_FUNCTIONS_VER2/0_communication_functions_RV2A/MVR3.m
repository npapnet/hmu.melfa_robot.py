function MVR(start_point, end_point, cycle_center)     %(STRING) \
        cmd=['1;1;EXECMVC ' start_point ', ' end_point ', ' cycle_center];
        SendCmd(cmd);
%kinite se tokso kuklou (i kuklo an start_point = end_point),R=distage(start/center) }