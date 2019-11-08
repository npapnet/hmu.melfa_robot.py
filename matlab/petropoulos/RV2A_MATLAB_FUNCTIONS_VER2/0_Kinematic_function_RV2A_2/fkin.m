function A0T=fkin(Jrc,robot)   %opou Jrc > oi gwnies pou didonte sto controler tou robot kai oxi oi gwnies tou modelou kata DH


% ελεγχος αν το το αποτελεσμα του παραπάνω ελέγχου είναι θετικό και επίλυση του ευθυ κινηματικού


theta=Jrc+robot.thetaoffset;

%
Q=Qcheck(Jrc,robot);
if isnan(Q)
    %error('ANGLES OUT OF RANGE, CHECK ANGLES')   %me to error termatizei i sunartiseis (RETURN)
    disp('--------------------------------------------------------------');
    disp('ANGLES OUT OF RANGE');
    disp('CHECK ANGLES');
    disp('JOINTS RANGE :');
    disp(robot.JointLimit);
    disp('--------------------------------------------------------------');
%      fprintf(2,'ANGLES OUT OF RANGE, CHECK ANGLES\n')  % disp me xrwma
%      2>RED
     return;
end
%%

%if check_result==1
    %Jw=Wrap_result;
    
% Μετασχηματισμός Denavit & Hartenberg 
% A=Rotz(θi)*Transz(di) * Rotx(αi)*Transx(ai)
%A0T is default conversion for NBASE & NTOOL / initial for RV2A
% Οπου A{i} > i-1Ai  > το πλαίσιο i σε σχέση με το προηγούμενο του

[crowd_of_link,~]=size(robot.DHmdf);    % crowd of links

A=cell(crowd_of_link,1);    % Preallocation A 

%% A >  Create links DHmdf transformation

for linkno=1:crowd_of_link   %links=1:6; % Vectorization , anti for link=1:6

%         link_parameters = [robot.DHmdf(linkno,1:3),theta(linkno)];                          %>[αi-1 , ai-1 , di , θι] 
       
        % link_parameters = (robot.DHmdf(linkno,:)+[0 0 0 theta(linkno)]); 
         
          [link_parameters]=create_link(theta(linkno),linkno,robot);
          
           A{linkno}=DHmdfconv(link_parameters );                   %δημιουργια μετασχηματισμού που περιγράφει πλαίσιο μέλους σε σχέση με προηγούμενο 

end


%http://www.mathworks.com/help/matlab/ref/cross.html#bt9u2fz-5

% na genikepsw kai na pros8ese A{1}*A{2}*.....A{n}

        A0T=robot.BASE * A{1} * A{2} * A{3} * A{4} *...
        A{5} * A{6} * robot.AWF * robot.TOOL;
%     disp(A0T)
    
    
%%
    %View Robot Skeleton Model
%     view_robot(A,robot);
%     pause(3);
    
%% 
%     melfa_pos=tr2melfa_pos(A0T);

    melfa_pos=tr2xyzABC(A0T);
    disp('-------------------------------------------------------------------------------------------');
    disp('MELFA BASIC POS GENERAL VECTOR without posture data (X, Y, Z, Ax, By, Cz)')
    disp('-------------------------------------------------------------------------------------------');
    disp(melfa_pos)
    disp('-------------------------------------------------------------------------------------------');

    
    %% DOKIMI    Serial_links_mechanism_skeleton_model(AA)
    AA{1}=robot.BASE;
    AA{2}=A{1};
    AA{3}=A{2};
    AA{4}=A{3};
    AA{5}=A{4};
    AA{6}=A{5};
    AA{7}=A{6};
    AA{8}=robot.AWF;
    AA{9}=robot.TOOL;
  
    
    Serial_links_mechanism_skeleton_model(AA)
    
    
  
end

function [link_parameters]=create_link(J,linkno,robot)

switch(robot.joints(linkno))
   case 'R'
%       disp(['Joint ', num2str(linkno) , ': REVOLUTE ' ,num2str(J),'deg'])
% disp('-------------------------------------------------------------------------------------------');
      %pros8esi parametrou J stin thetai
     link_parameters = (robot.DHmdf(linkno,:)+[0 0 0 J]); 
   case {'P'}
%       disp('PRISMATIC')
%       disp('-------------------------------------------------------------------------------------------');
      %pros8esi parametrou J stin di
      link_parameters = (robot.DHmdf(linkno,:)+[0 0 J 0]); 
    otherwise
        disp('-------------------------------------------------------------------------------------------');
        disp('CHECK Joints parameters in robot.mat file ');
        error('CKECK JOINTS PARAMETERS');
        disp('-------------------------------------------------------------------------------------------');
end
end


