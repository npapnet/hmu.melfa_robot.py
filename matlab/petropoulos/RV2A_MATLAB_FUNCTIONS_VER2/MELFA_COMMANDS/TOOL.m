function ex=TOOL(PosData)



        if ischar(PosData)
            if (PosData(1)=='P' && length(PosData)>1)
                cmd=['1;1;EXECTOOL ' PosData];
            else
                disp('LATHOS')
                return;
            end
        else 
            TOOLxyzABC=posData2xyzABC(PosData);

            SETPOSITION('PTOOL', TOOLxyzABC );
  
            cmd= '1;1;EXECTOOL PTOOL'; 
        end
        
        reply=SendCmd(cmd);
        ex=strcmp(reply(1:3),'QoK');
      
      
end
