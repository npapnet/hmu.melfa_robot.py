%Open Communication
%na pros8esw ws orismata to BaudRAte DataBits Parity etc wste na genikepsw
%ti sunartisi
% Episis to onoma tis metablitis sto opoio 8a kataxwrite i seriaki ?????
function OPENCOM(COM_PORT)
 global RV2A_com;
RV2A_com = serial(['COM' num2str(COM_PORT)], 'BaudRate', 9600, 'DataBits', 8,'Parity', 'even', 'StopBits', 2, 'Terminator','CR');

    fopen(RV2A_com);
%     disp(RV2A_com)
end

