%Set Point   %(0,6) ????? (R,N,A)etc
% NA prosthesw proseggisi RNA FLip left Above (elexos apo ink)
function SETPOINT(nop, x , y , z , A , B , C) %nop>name of point 1 , 2 , curr etc
      cmd=['1;1;EXEC P' nop ' = ('  num2str(x,'%10.3f') ', ' num2str(y,'%10.3f') ', ' num2str(z,'%10.3f') ', ' num2str(A,'%10.3f') ', ' num2str(B,'%10.3f') ', ' num2str(C,'%10.3f') ')'];
      SendCmd(cmd);
end