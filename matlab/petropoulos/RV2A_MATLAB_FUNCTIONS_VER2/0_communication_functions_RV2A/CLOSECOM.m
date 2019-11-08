 %Close Communication
 function CLOSECOM()
        global s;
        SRV('OFF')
        pause(0.2);
        fclose(s);
        delete(s);
        s=-1;
 end