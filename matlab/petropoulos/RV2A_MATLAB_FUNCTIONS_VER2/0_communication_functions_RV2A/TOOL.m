function TOOL(x,y,z,A,B,C)

      SETCOOR('PCT', x , y , z , A , B , C);
      cmd=['1;1;EXECTOOL PCT' ];
      SendCmd(cmd);
      
      
      %hand tool coor 0 0 120  0   -9   -9
      
      
end
