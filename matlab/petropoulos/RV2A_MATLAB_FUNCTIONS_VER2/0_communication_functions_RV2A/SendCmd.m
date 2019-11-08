

%Send command to robot and get reply with fscanf
function reply = SendCmd(cmd) 

global RV2A_com;

fprintf(RV2A_com,cmd);

pause(0.02);

reply=fscanf(RV2A_com);
disp(reply);
end