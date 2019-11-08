function ex=MVJ(J,varargin) 

opt.now = false;
opt.wait=false;
opt = tb_optparse(opt, varargin);


        if opt.now
            STOP;
        elseif opt.wait
            GETSTATE('WaitForStop');
        end
        
        
        if ischar(J)
            if (J(1)=='J' && length(J)>1)
        cmd=['1;1;EXECMOV ' J];
            else
                disp('LATHOS')
                return;
            end
        elseif (isnumeric(J))
            SETJOINTSVAL('JMOV',J)
            cmd='1;1;EXECMOV JMOV';
        end
        
        reply=SendCmd(cmd);
        ex=strcmp(reply(1:3),'QoK');
end