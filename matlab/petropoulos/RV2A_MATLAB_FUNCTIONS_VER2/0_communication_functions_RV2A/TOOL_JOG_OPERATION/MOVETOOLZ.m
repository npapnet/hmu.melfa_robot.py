function MOVETOOLZ(delta_z)  %delta_x distance in mm

reply=SETCOOR('PMDZ',0,0,delta_z,0,0,0);
pause(0.1);
if strcmp(reply(1:3),'QoK')
    MOV('P_CURR*PMDZ')
end
end
