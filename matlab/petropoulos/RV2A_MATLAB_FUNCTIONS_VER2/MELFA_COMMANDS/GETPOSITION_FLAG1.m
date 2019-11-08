%>> GETPOSITION
%QoKX;535.21;Y;-0.03;Z;779.78;A;-89.97;B;0.03;C;0.00;;7,0;50;0.00;00000000
%GET POSITION
function robotposition_flag1=GETPOSITION_FLAG1()

cmd=('1;9;PPOSF');  
     
reply=SendCmd(cmd);    %na vrw pws katharizw i seiriaki

 
 
 robotposition_flag1=str2num(reply((strfind(reply, ';;')+2)));

%disp(robotposition);

end