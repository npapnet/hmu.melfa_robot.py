
function SAFEMODE()

global s;

s = serial('COM1', 'BaudRate', 9600, 'DataBits', 8,'Parity', 'even', 'StopBits', 2, 'Terminator','CR');

    fopen(s);
    
    RSTALRM();

    CNTL('ON');
   
    SRV('ON');
    
    OVRD(10.0);
    
    JOVRD(10.0);   %set default JOVR / OVRD
    
    ACCEL(20,20);