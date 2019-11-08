% SET CATESIAN POSITION DATA

function ex=SETPOSITION(nop,PosData,varargin)

FLAGS=[0 1 2 3 4 5 6 7];
%----------------------------------------------------------------------------
if isempty(varargin) 
    FLAG1=[];
elseif any(FLAGS==varargin{1})
    FLAG1=['(' num2str(varargin{1}) ',0)'];
else
    disp('-------------------------------------------------------------------------')
    disp('-------------------------------------------------------------------------')

    warndlg('LATHOS POSTURE FLAG');
    error('LATHOS POSTURE FLAG')
    
    return;
end
%----------------------------------------------------------------------------

    if (nop(1)=='P'  && length(nop)>1)
        if isnumeric(PosData)
                c=posData2xyzABC(PosData);  %convert position data to general vector [X,Y,Z,A,B,C]

         cmd1=['1;1;EXEC ' nop ' = ('...
          num2str(c(1),'%10.3f') ', '... 
          num2str(c(2),'%10.3f') ', '...
          num2str(c(3),'%10.3f') ', '... 
          num2str(c(4),'%10.3f') ', '...
          num2str(c(5),'%10.3f') ', '... 
          num2str(c(6),'%10.3f') ')'];
           cmd=[cmd1,FLAG1];
        elseif strcmp(PosData,'current')
            cmd=['1;1;EXEC' nop '=P_CURR'];
        end
      reply=SendCmd(cmd);
      ex=strcmp(reply(1:3),'QoK');
    else 
    disp('-------------------------------------------------------------------------')
    disp('LATHOS ONOMA METAVLHTHS, H METAVLHTH PREPEI NA KSKINAEI ME TO GRAMMA >P< KAI NA AKOLOUTHEI ARITHMOS I GRAMMA')
    disp('-------------------------------------------------------------------------')
   
    warndlg('LATHOS ONOMA METAVLITIS');
    error('LATOS ONOMA METAVLITIS')
    
    end

    

end