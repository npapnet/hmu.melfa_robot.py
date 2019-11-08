% fkinRV2A
%
% FORWARD KINEMATIC FOR MITSUBISHI RV2A
%
% INPUT: JOINTS VARIABLES (Q) is 6x1 or 1x6 vector
%
% OUTPUT 1: COORDINATES OF TOOL {T} ABOUT
%         WORD {W} FRAME IN HOMOTGENOUS TRANSFORMATION
% OUTOUT 2: RETURN POSTURE FLAG1 FOR ROBOT POZE          
%
% Options:
%  'MELFA' RETURN OUTPUT 1 GENERAL VECTOR FORM [X,Y,Z,A,B,C] -> A B C FIXED ANGLES X-Y-Z         
%  'disp'  DISPAY ROBOT IN MATLAB PLOT
%
% EXAMPLES:
%   [T,FLAG1]=fkinRV2A([0 0 90 0 0 0]);
%   [t,FLAG1]=fkinRV2A([40 20 120 0 40 60],'MELFA','disp');
%   [T,~]=fkinRV2A([ 0 30 90 40 40 30],'disp');
%
% DIMITRIS PETROPOULOS



function [OUTPUT,FLAG1]=fkinRV2A( Q,varargin)   %opou Jrc > oi gwnies pou didonte sto controler tou RV2A kai oxi oi gwnies tou modelou kata DH
global RV2A

if isempty(RV2A)
    disp('--------------------------------------------------------------');
    disp('LOAD RV2A.mat FILE IN WORKSPACE')
    warndlg('LOAD RV2A.mat FILE IN WORKSPACE');
    disp('--------------------------------------------------------------');
    return;
end

if size(Q)==[1,6]
    Q=Q';
elseif length(Q)~=6
    disp('CHECK INSERT VALUES')
    return;
end

OUTPUT=[];
FLAG1=[];



opt.MELFA = false;
opt.disp = false;
opt.skeleton = false;
opt.workspace = false;
opt = tb_optparse(opt, varargin);

% OPTIONS > 'MELFA' RETURN MELFA BASIC GENERAL VECTOR
% OPTIONS > 'disp'  display_robot

%% CHECK GIVEN JOINTS VARIABLES
Q=Qcheck(Q,RV2A);
if isnan(Q)
    disp('--------------------------------------------------------------');
    disp('ANGLES OUT OF RANGE');
    disp('CHECK ANGLES');
    disp('JOINTS RANGE :');
    disp(RV2A.JointLimit);
    disp('--------------------------------------------------------------');
     return;
end

%% CONVERT ANGLES FROM ROBOT CONTROLLER TO KINEMATIC MODEL ANGLES
TH=Q+RV2A.thetaoffset;

%% EXPORT LINK PARAMETERS FOR GIVEN JOINTS VARIABLES

A{1}=DHmdfconv([RV2A.DHmdf(1,1:3),TH(1)]); % A01
A{2}=DHmdfconv([RV2A.DHmdf(2,1:3),TH(2)]); % A12
A{3}=DHmdfconv([RV2A.DHmdf(3,1:3),TH(3)]); % A23
A{4}=DHmdfconv([RV2A.DHmdf(4,1:3),TH(4)]); % A34
A{5}=DHmdfconv([RV2A.DHmdf(5,1:3),TH(5)]); % A45
A{6}=DHmdfconv([RV2A.DHmdf(6,1:3),TH(6)]); % A56

%% CALCULATE COORDINATE OF TOOL FRAME ABOUT WORLD FRAME
AWT=RV2A.BASE * A{1} * A{2} * A{3} * A{4} *A{5} * A{6} * RV2A.AWF * RV2A.TOOL;

OUTPUT=AWT;
FLAG1=ExportFLAG1;


%% CONVERT HOMOGENOUS TRANFORMATION TO GENERAL VECTOR [X,Y,Z,A,B,C]

    melfa_pos=tr2xyzABC(AWT);
    disp('-------------------------------------------------------------------------------------------');
    disp('MELFA BASIC POSITION GENERAL VECTOR (X, Y, Z, Ax, By, Cz)(FLAG1,0)')
    disp('-------------------------------------------------------------------------------------------');
    disp(round(melfa_pos*100)/100 )
     
    fprintf('FLAG1 = %i  ( %s ) \n',FLAG1,PF)
    
    disp('-------------------------------------------------------------------------------------------');
    
    if opt.MELFA
        melfa_pos=tr2xyzABC(AWT);
        OUTPUT=melfa_pos;
    end
        
        
%% PLOT RV2A MODEL
    if opt.disp
        T{1}=RV2A.BASE;
        T{2}=A{1};
        T{3}=A{2};
        T{4}=A{3};
        T{5}=A{4};
        T{6}=A{5};
        T{7}=A{6};
        T{8}=RV2A.AWF;
        T{9}=RV2A.TOOL;
        
        
        W=[];
        if opt.workspace
            dispRV2A(T,'workspace')
            W='workspace';
        end 
            if isfield(RV2A,'STL') && ~opt.skeleton
            dispRV2A(T,W)
            else
            Serial_links_mechanism_skeleton_model(T,'frames','joints')
            end
        
    end
   
%% CALCULATE POSTURE FLAG1    
    function FLAG1=ExportFLAG1()
        %EXPORT POSTURE FOR ARM (LEFT(0)/RIGHT(1))
        P1W= A{2} * A{3} * A{4}*[0 0 0 1]'; % CALCULATE WRIST POSITION COORFINATES ABOUT {1}
        if P1W(1)>=0;
            FL1=1;
            PF(1)='R';
        else
            FL1=0;
            PF(1)='L';
        end
        
        %EXPORT POSTURE FOR ELBOW (ABOVE(1)/BELOW(0))
        P2W= A{3} * A{4}*[0 0 0 1]';  %CALCULATE WRIST POSITION ABOUT {2}
        if P2W(2)>=0; 
            FL2=1; 
            PF(2)='A';
        else
            FL2=0; 
            PF(2)='B';
        end
        
        %EXPORT POSTURE FOR WRIST (NONFLIP(1) / FLIP(0))
        if Q(5)>=0; 
            FL3=1; 
            PF(3)='N';
        else
            FL3=0; 
            PF(3)='F';
        end
        FLAG1=bin2dec([num2str(FL1) num2str(FL2) num2str(FL3)]);
        
    end
  
end