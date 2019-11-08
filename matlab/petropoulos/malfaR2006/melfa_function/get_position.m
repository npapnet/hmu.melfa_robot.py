%GET POSITION
function robotposition=get_position(s)
     cmd = ['1;9;PPOSF'];
     fprintf(s,cmd);  
     robotposition=fscanf(s);    %na vrw pws adeiazei i seiriaki