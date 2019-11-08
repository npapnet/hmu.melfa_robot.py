function ex=MVT(position,varargin)   
%------------------------------------------------------
opt.now = false;
opt.wait=false;
opt.straight=false;
opt = tb_optparse(opt, varargin);
%------------------------------------------------------
        if opt.now
            STOP;
        elseif opt.wait
            GETSTATE('WaitForStop');
        end
%------------------------------------------------------
        if opt.straight
            MT='MVS';   %MOVE TYPE
        else
            MT='MOV';
        end
%------------------------------------------------------       
        if ischar(position)
            if (position(1)=='P' && length(position)>1)
        cmd=['1;1;EXEC' MT ' P_CURR*' position];
            else
                disp('LATHOS')
                return;
            end
        elseif (isnumeric(position))
            
            SETPOSITION('PMVT',position)
            
            cmd=['1;1;EXEC' MT ' P_CURR*PMVT'];
        end
%------------------------------------------------------        
        reply=SendCmd(cmd);
        ex=strcmp(reply(1:3),'QoK');
end