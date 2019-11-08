%>> GETPOSITION
%QoKX;535.21;Y;-0.03;Z;779.78;A;-89.97;B;0.03;C;0.00;;7,0;50;0.00;00000000
%GET POSITION
function robotposition=GETPOSITION()

cmd=('1;9;PPOSF');  
     
reply=SendCmd(cmd);    %na vrw pws katharizw i seiriaki

%robotposition=reply;
AA = strfind(reply, ';');

 robotposition =[str2num(     reply((strfind(reply, 'X;')+2): AA(find(strfind(reply, ';') >(strfind(reply, 'X;')+2), 1, 'first')))  ) 
                 str2num(     reply((strfind(reply, 'Y;')+2): AA(find(strfind(reply, ';') >(strfind(reply, 'Y;')+2), 1, 'first')))  )   
                 str2num(     reply((strfind(reply, 'Z;')+2): AA(find(strfind(reply, ';') >(strfind(reply, 'Z;')+2), 1, 'first')))  ) 
                 str2num(     reply((strfind(reply, 'A;')+2): AA(find(strfind(reply, ';') >(strfind(reply, 'A;')+2), 1, 'first')))  ) 
                 str2num(     reply((strfind(reply, 'B;')+2): AA(find(strfind(reply, ';') >(strfind(reply, 'B;')+2), 1, 'first')))  ) 
                 str2num(     reply((strfind(reply, 'C;')+2): AA(find(strfind(reply, ';') >(strfind(reply, 'C;')+2), 1, 'first')))  )];
             
             %robotposition_flag1=str2num(reply((strfind(reply, ';;')+2)));
             
             
            %robotposition=posData2tr(robotposition)
             

%disp(robotposition);

end