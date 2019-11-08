%Set Point   %(0,6) ????? (R,N,A)etc
function SETPOINT(nop, x, y , z , A , B , C) %nop>number of point
      cmd=['1;1;EXECP' nop ' = ('  num2str(x,'%10.3f') ', ' num2str(y,'%10.3f') ', ' num2str(z,'%10.3f') ', ' num2str(A,'%10.3f') ', ' num2str(B,'%10.3f') ', ' num2str(C,'%10.3f') ')'];
      fprintf(s,cmd);