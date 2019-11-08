%Set Point   %(0,6) ????? (R,N,A)etc
% NA prosthesw proseggisi RNA FLip left Above (elexos apo ink)


function [reply]=SETCOOR(nop, c1 , c2 , c3 , c4 , c5 , c6)
%c1,2,3,4,5,6->x,y,z,A,B,C > for cartesian coordinates]

%c1,2,3,4,5,6->J1:6> for JOINTS coordinates]
if nop(1)=='P' || nop(1)=='J'
      cmd=['1;1;EXEC ' nop ' = ('  num2str(c1,'%10.3f') ', ' num2str(c2,'%10.3f') ', ' num2str(c3,'%10.3f') ', ' num2str(c4,'%10.3f') ', ' num2str(c5,'%10.3f') ', ' num2str(c6,'%10.3f') ')'];
      reply=SendCmd(cmd);
else 
    disp('-----------------------------lathos<><><><><>?????-------------')
end
    
end