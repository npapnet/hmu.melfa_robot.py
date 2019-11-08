function ROT_TOOL_X(delta_A)  %delta_x distance in mm

reply=SETCOOR('PMTA',0,0,0,delta_A,0,0);
pause(0.1);
if strcmp(reply(1:3),'QoK')
    MOV('P_CURR*PMTA')
end
end
