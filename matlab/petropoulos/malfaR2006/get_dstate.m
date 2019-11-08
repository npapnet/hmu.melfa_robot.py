function get_dstate()
global s;
cmd=['1;1;DSTATE'];
fprintf(s,cmd);
        pause(0.05);

st = hex2dec(substr(fscanf(s), 3, 2));
RSTATE.CycleOrRepeat = bitand(st,1) ~= 0;          % 0 = Cycle, 1 = Repeat
RSTATE.CycleStop = bitand(st,2) ~= 0;              % 0 = ON, 1 = OFF
RSTATE.Mlock = bitand(st,4) ~= 0;                  % 0 = OFF, 1 = ON
RSTATE.AutoOrTeach = bitand(st,8) ~= 0;            % 0 = AUTO, 1 = TEACH
RSTATE.RunningOfTeachMode = bitand(st,16) ~= 0;    % 0 = OFF, 1 = ON
RSTATE.ServoOn = bitand(st,32) ~= 0;               % 0 = OFF, 1 = ON
RSTATE.Stopped = bitand(st,64) == 0;               % 0 = RUN, 1 = STOP
RSTATE.ControlOn = bitand(st,128) ~= 0;            % 0 = OFF, 1 = ON
RSTATE.Invalid = bitand(st,256) ~= 0;              % 0 = Valid, 1 = Invalid
