function ROT_TOOL_Y(delta_B)  %delta_x distance in mm

reply=SETCOOR('PMTB',0,0,0,0,delta_B,0);
pause(0.1);
if strcmp(reply(1:3),'QoK')
    MOV('P_CURR*PMTB')
end
end
