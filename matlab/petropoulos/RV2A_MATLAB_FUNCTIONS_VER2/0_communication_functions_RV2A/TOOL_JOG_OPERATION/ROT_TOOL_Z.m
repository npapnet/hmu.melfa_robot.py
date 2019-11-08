function ROT_TOOL_Z(delta_C)  %delta_x distance in mm

reply=SETCOOR('PMTC',0,0,0,0,0,delta_C);
pause(0.1);
if strcmp(reply(1:3),'QoK')
    MOV('P_CURR*PMTC')
end
end
