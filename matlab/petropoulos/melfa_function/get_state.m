function DSTATEreply = get_state(s)

fprintf(s,'1;1;DSTATE');     %na ftiaksw function na stelnei cmd kai na diavazei reply / kata tin ekinisi na diabazw ews otou isempty(s)
pause(0.02);
reply=fscanf(s);

%reply='QoKA1060;1;0'      %Dokimi

st = hex2dec(reply(4:5));



DSTATEreply.CycleOrRepeat = bitand(st,1) ~= 0;          % 0 = Cycle, 1 = Repeat
DSTATEreply.CycleStop = bitand(st,2) ~= 0;              % 0 = ON, 1 = OFF
DSTATEreply.Mlock = bitand(st,4) ~= 0;                  % 0 = OFF, 1 = ON
DSTATEreply.AutoOrTeach = bitand(st,8) ~= 0;            % 0 = AUTO, 1 = TEACH
DSTATEreply.RunningOfTeachMode = bitand(st,16) ~= 0;    % 0 = OFF, 1 = ON
DSTATEreply.ServoOn = bitand(st,32) ~= 0;               % 0 = OFF, 1 = ON
DSTATEreply.Stopped = bitand(st,64) == 0;      %????         % 0 = RUN, 1 = STOP
DSTATEreply.ControlOn = bitand(st,128) ~= 0;            % 0 = OFF, 1 = ON
DSTATEreply.Invalid = bitand(st,256) ~= 0;              % 0 = Valid, 1 = Invalid
    
end