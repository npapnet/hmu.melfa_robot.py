function test()
global RSTATE;
global S;
global s;


S=1;
for i=1:20
    
    fprintf(s,'1;1;DSTATE');
        pause(0.05);

st = hex2dec(substr(fscanf(s), 3, 2));
RSTATE.Stopped = bitand(st,64) ~= 0;               % 0 = RUN, 1 = STOP
    




while RSTATE.Stopped == 1
    
fprintf(s,'1;1;DSTATE');
        pause(0.05);
        st = hex2dec(substr(fscanf(s), 3, 2));
        RSTATE.Stopped = bitand(st,64) ~= 0;               % 0 = RUN, 1 = STOP

   
end

if S==1
    S=S+1;
    fprintf(s,'1;1;EXECMOV P10')
    pause(0.02);
    fscanf(s);
elseif S==2;
    S=S+1;
    fprintf(s,'1;1;EXECMOV P8')
    pause(0.02);
    fscanf(s);
    elseif S==3;
    S=1;
    fprintf(s,'1;1;EXECMOV P3')
    pause(0.02);
    fscanf(s);
end

pause(0.05)
end