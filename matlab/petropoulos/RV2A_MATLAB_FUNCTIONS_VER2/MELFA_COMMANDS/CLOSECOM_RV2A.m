 %Close Communication
 function CLOSECOM_RV2A()
        global RV2A_com;
        SERVO('OFF')
        pause(0.2);
        fclose(RV2A_com);
        delete(RV2A_com);
        %s=-1;
 end

