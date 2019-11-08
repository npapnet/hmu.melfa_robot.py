%SET SERVO ON / OFF (1 /0)
function SRV(SERVOSTATE)   %SERVOSTATE 'ON' 'OFF' 1 0
    if SERVOSTATE==1
        SERVOSTATE='ON';
    elseif SERVOSTATE==0
            SERVOSTATE='OFF';
    end
      cmd=['1;1;SRV' SERVOSTATE ];
      SendCmd(cmd);
end