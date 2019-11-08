
%reply='QoKJ1;-0.01;J2;8.15;J3;68.99;J4;0.03;J5;12.89;J6;0.00;;****,****;50;0.00;00000000'

function robotjoints=GETJOINTSVAL()

cmd=('1;9;JPOSF');  
     
reply=SendCmd(cmd);    %na vrw pws katharizw i seiriaki

%robotjoints=reply;
AA = strfind(reply, ';');
robotjoints=[str2num(     reply((strfind(reply, 'J1;')+3): AA(find(strfind(reply, ';') >(strfind(reply, 'J1;')+2), 1, 'first')))  ) 
                 str2num(     reply((strfind(reply, 'J2;')+3): AA(find(strfind(reply, ';') >(strfind(reply, 'J2;')+3), 1, 'first')))  )   
                 str2num(     reply((strfind(reply, 'J3;')+3): AA(find(strfind(reply, ';') >(strfind(reply, 'J3;')+3), 1, 'first')))  ) 
                 str2num(     reply((strfind(reply, 'J4;')+3): AA(find(strfind(reply, ';') >(strfind(reply, 'J4;')+3), 1, 'first')))  ) 
                 str2num(     reply((strfind(reply, 'J5;')+3): AA(find(strfind(reply, ';') >(strfind(reply, 'J5;')+3), 1, 'first')))  ) 
                 str2num(     reply((strfind(reply, 'J6;')+3): AA(find(strfind(reply, ';') >(strfind(reply, 'J6;')+3), 1, 'first')))  )];

%disp(robotjoints);

end