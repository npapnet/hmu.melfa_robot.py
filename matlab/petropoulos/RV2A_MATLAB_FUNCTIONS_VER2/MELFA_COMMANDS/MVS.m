
function ex=MVS(position,varargin) 
opt.now = false;
opt.wait=false;
opt = tb_optparse(opt, varargin);


        if opt.now
            STOP;
        elseif opt.wait
            GETSTATE('WaitForStop');
        end




        
        if ischar(position)
            if (position(1)=='P' && length(position)>1)
                cmd=['1;1;EXECMVS ' position];
            else
                disp('LATHOS')
                return;
            end
        elseif (isnumeric(position) && isempty(varargin))
            SETPOSITION('PMVS',position)
            cmd='1;1;EXECMVS PMVS';
        elseif (isnumeric(position) && ~isnumeric(varargin{1}))
            SETPOSITION('PMVS',position)
            cmd='1;1;EXECMVS PMVS';
        elseif (isnumeric(position) && isnumeric(varargin{1}))
            SETPOSITION('PMVS',position,varargin{1})
            cmd='1;1;EXECMVS PMVS';
        end
        
             reply=SendCmd(cmd);
            ex=strcmp(reply(1:3),'QoK');


        
end