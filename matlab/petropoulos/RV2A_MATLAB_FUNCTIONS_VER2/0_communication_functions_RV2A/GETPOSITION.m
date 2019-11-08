
%GET POSITION
function robotposition=GETPOSITION()

cmd=('1;9;PPOSF');  
     
reply=SendCmd(cmd);    %na vrw pws katharizw i seiriaki

robotposition=reply;

% disp(robotposition);

end