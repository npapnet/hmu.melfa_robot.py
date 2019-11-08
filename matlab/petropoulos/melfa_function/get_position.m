%GET POSITION
function robotposition=get_position()
     cmd = ['1;9;PPOSF'];
     fprintf(s,cmd);  
     robotposition=fscanf(s);    %na vrw pws adeiazei i seiriaki