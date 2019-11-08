function MOVE_BASE_Z(delta_z)  %delta_x distance in mm

reply=SETCOOR('PMBZ',0,0,delta_z,0,0,0);
pause(0.1);
if strcmp(reply(1:3),'QoK')
    MOV('PMBZ*P_CURR')
end
end
