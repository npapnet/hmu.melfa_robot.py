%SET ACCELERATION /DECELERATION
function ACCEL(accel,decel)
      cmd=['1;1;EXECACCEL' num2str(accel) ', ' num2str(decel) ];
      fprintf(s,cmd);