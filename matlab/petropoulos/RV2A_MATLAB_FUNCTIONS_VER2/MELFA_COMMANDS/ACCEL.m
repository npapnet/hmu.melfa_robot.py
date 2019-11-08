%SET ACCELERATION /DECELERATION
function ex=ACCEL(accel,varargin)
        
        if isempty(varargin)
            deccel=accel;
        else
            deccel=varargin{1};
        end
        if accel>0 && accel<=400 && deccel>0 && deccel<=400
      cmd=['1;1;EXECACCEL ' num2str(accel) ',' num2str(deccel) ];
        reply=SendCmd(cmd);
        ex=strcmp(reply(1:3),'QoK');
        else
             disp('LATHOS ACCEL')
    end

end