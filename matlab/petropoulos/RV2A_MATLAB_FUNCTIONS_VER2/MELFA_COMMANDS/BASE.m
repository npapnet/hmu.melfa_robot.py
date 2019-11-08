function ex=BASE(PosData)
              
if ischar(PosData)
            if (PosData(1)=='P' && length(PosData)>1)
                cmd=['1;1;EXECBASE ' PosData];
            else
                disp('LATHOS')
                return;
            end
        else 

      BASExyzABC=posData2xyzABC(PosData);
      
      SETPOSITION('PBASE', BASExyzABC );
      
      cmd='1;1;EXECBASE PBASE';

end
        reply=SendCmd(cmd);
        ex=strcmp(reply(1:3),'QoK');     

       
      
      
end