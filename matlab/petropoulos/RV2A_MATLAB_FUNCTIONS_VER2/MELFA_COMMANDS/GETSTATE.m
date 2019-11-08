function [DSTATEreply]=GETSTATE(varargin)

opt.Stopped = false;
opt.WaitForStop=false;
opt = tb_optparse(opt, varargin);



cmd='1;1;DSTATE';     %na ftiaksw function na stelnei cmd kai na diavazei reply / kata tin ekinisi na diabazw ews otou isempty(s
reply=SendCmd(cmd);
st = hex2dec(reply(4:5));

%reply='QoKA1060;1;0'      %Dokimi
if opt.Stopped
    DSTATEreply = bitand(st,64) == 0;      %????         % 0 = RUN, 1 = STOP

elseif opt.WaitForStop
    
    s=false;
    while ~s
    pause(0.02);
    reply=SendCmd(cmd);
    st = hex2dec(reply(4:5));
    s= bitand(st,64) == 0;      %????         % 0 = RUN, 1 = STOP
    end
    
    DSTATEreply=s;
    
else
    DSTATEreply.ServoOn = bitand(st,32) ~= 0;               % 0 = OFF, 1 = ON
    DSTATEreply.Stopped = bitand(st,64) == 0;      %????         % 0 = RUN, 1 = STOP
    DSTATEreply.ControlOn = bitand(st,128) ~= 0;            % 0 = OFF, 1 = ON
end



end