%Open Communication
function OPENCOM()
global s;
s = serial('COM1', 'BaudRate', 9600, 'DataBits', 8,'Parity', 'even', 'StopBits', 2, 'Terminator','CR');

    fopen(s);
