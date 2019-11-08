function MOVE_BASE_X(delta_x)  %delta_x distance in mm

reply=SETCOOR('PMBX',delta_x,0,0,0,0,0);
pause(0.1);
if strcmp(reply(1:3),'QoK')
    MOV('PMBX*P_CURR')
end
end
