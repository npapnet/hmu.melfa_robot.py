function ex=MVC(P1, P2, P3,varargin)     %(STRING) \

P=cell(1,3);
P{1}=P1;
P{2}=P2;
P{3}=P3;

opt.now = false;
opt.wait=false;
opt = tb_optparse(opt, varargin);


        if opt.now
            STOP;
        elseif opt.wait
            GETSTATE('WaitForStop');
        end


for i=1:3

        if ischar(P{i})
            if (P{i}(1)=='P' && length(P{i})>1)
                eval(['PMR', int2str(i),' = P{i};']);
                
            else
                disp('LATHOS')
                return;
            end
        elseif isnumeric(P{i})
            SETPOSITION(['PMVR', num2str(i)],P{i});
            PMRi=['PMVR', num2str(i)];
            eval(['PMR', int2str(i),' = PMRi;']);
            %cmd='1;1;EXECMOV PMOV';
        end
end


        cmd=['1;1;EXECMVC ' PMR1 ', ' PMR2 ', ' PMR3];
        reply=SendCmd(cmd);
        ex=strcmp(reply(1:3),'QoK');
end