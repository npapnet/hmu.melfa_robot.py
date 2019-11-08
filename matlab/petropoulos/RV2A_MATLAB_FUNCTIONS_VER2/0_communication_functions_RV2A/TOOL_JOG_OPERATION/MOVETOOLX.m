function MOVETOOLX(delta_x)  %delta_x distance in mm

reply=SETCOOR('PMDX',delta_x,0,0,0,0,0);
pause(0.1);
if strcmp(reply(1:3),'QoK')
    MOV('P_CURR*PMDX')
end
end

