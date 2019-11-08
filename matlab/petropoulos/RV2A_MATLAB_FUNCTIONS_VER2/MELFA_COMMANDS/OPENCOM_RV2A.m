%Open Communication for RV2A CR1-571
%BaudRATE 9600
function OPENCOM_RV2A(COM_PORT)
 global RV2A_com;
RV2A_com=serial(['COM' num2str(COM_PORT)],...
                    'BaudRate', 9600,...
                    'DataBits',8,'Parity', 'even',...
                    'StopBits', 2, 'Terminator','CR');
    fopen(RV2A_com);
    
    pause(0.02)
    
    disp(RV2A_com)
end

