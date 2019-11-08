 %Close Communication
 function CLOSECOM()
        global s;
        fprintf(s,'1;1;SRVOFF');
        pause(0.2);
        fclose(s);
        delete(s);
        s=-1;