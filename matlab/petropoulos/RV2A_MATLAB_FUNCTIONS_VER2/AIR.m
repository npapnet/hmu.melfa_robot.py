function  AIR( AIRSTATE )
%AIR (AIRSTATE)  Handles the suction pad state, 1 - on / 2 - off
        cmd=['1;1;EXEC M_OUT(4)=' num2str(AIRSTATE) ]; 
      SendCmd(cmd);
  end

