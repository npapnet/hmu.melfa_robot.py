function MOVETOOLY(delta_y)  %delta_x distance in mm

reply=SETCOOR('PMDY',0,delta_y,0,0,0,0);
pause(0.1);
if strcmp(reply(1:3),'QoK')
    MOV('P_CURR*PMDY')
end
end
