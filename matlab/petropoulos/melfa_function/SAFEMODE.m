function SAFEMODE()
global s;
s = serial('COM1', 'BaudRate', 9600, 'DataBits', 8,'Parity', 'even', 'StopBits', 2, 'Terminator','CR');

    fopen(s);
    
    fprintf(s,'1;1;RSTALRM');
    pause(0.2);
    
    fprintf(s,'1;1;CNTLON');
    pause(0.2);
    
    fprintf(s,'1;1;SRVON');
    pause(0.2);
    
    fprintf(s,['1;1;EXECOVRD 10.0']);
    pause(0.2);
    
    fprintf(s,['1;1;EXECJOVRD 10.0']);   %set default JOVR / OVRD
    pause(0.2);
    
    fprintf(s,['1;1;EXECACCEL 20, 20']);
    pause(0.2);