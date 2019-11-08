% ikinRV2A
%
% INVERSE KINEMATIC FOR MITSUBISHI RV2A
%
% INPUT: CORDINATES OF TOOL {T} ABOUT WORD FRAME {W}
%        IN HOMOGENOUS TRANDORMATION (4x4) FORM
%        OR GENERAL VECTOR [X,Y,Z,A,B,C] FORM
%
% OUTPUT: JOINTS VARIABLES FOR GIVEN POSITION AND ORIENTATION 
%
% EXAMPLES:
%   [T,FLAG1]=fkinRV2A([0 0 90 0 0 0]);
%   Q=ikinRV2A(T);
%   [t,FLAG1]=fkinRV2A([40 20 120 0 40 60],'MELFA');
%   Q=ikinRV2A(t)
%
% DIMITRIS PETROPOULOS



function [Q]=ikinRV2A(POSDATA)
global RV2A

if isempty(RV2A)
    disp('--------------------------------------------------------------');
    disp('LOAD RV2A.mat FILE IN WORKSPACE')
    disp('--------------------------------------------------------------');
    return;
end
% warning('off','all');
% warning;

global L2 L3 ABW PBW x y z 

%CONVERT POSITION DATA TO HOMOGENOUS COORDINATES
AworldT=posData2tr(POSDATA);

L2=250;                                 
L3=sqrt(250^2+130^2);
x=1;
y=2;
z=3;

% POSITION & ORIENTATION FROM WORLD FRAME TO ROBOT BASE FRAME 

ABT=RV2A.BASE\AworldT;              %TOOL FRAME ABOUT ROBOT BASE FRAME {0}

% CALCULATE WRIST POSITION & ORIENTATION <FROM TOOL FRAME GO BACK TO WRIST FRAME>

ABW=ABT/RV2A.TOOL/RV2A.AWF;         %ABW->POSITION & ORIENTATION OF WRIST ABOUT ROBOT BASE {0}
PBW=ABW*[0 0 0 1]';                 %CALCULATE WRIST POSITION (XYZ) ABOUT ROBOT BASE FRAME

THETA=[];

% INVERSE KINEMATIC FOR POSITION
%% CALCULATE SOLUTION FOR JOINT 1 (WAIST)
%-------------------------------------------------------------------------------------------------------
TH1right=atan2d(PBW(y),PBW(x));     % RIGHT SOLUTION <Project of Wrist position on XY PLANE OF BASE>
TH1left=TH1right+180;               % LEFT SOLUTION (Symmetry solution for TH1right)
%-------------------------------------------------------------------------------------------------------

%% CALCULATE SOLUTION FOR JOINT 2-3  (SHOULDER-ELBOW)
%-------------------------------------------------------------------------------------------------------
    for TH1=[TH1left,TH1right]    % for LEFT & RIGHT
        
        P2_0W =   DHmdfconv([RV2A.DHmdf(1,1:3),TH1])*...   
                  DHmdfconv([RV2A.DHmdf(2,1:3),0])  \  PBW;  % AB1(TH1)*A12(0)\ PBW

        % CALL FUNCTION ikin2link_RV2A for calculate angle of SHOULDER & ELBOW
        [TH23above,TH23below]=ikin2link_RV2A(P2_0W); % RETURN 2 pairs of solution
           
%% INVERSE KINEMATIC FOR ORIENTATION
% CALCULATE SOLUTION FOR WRIST JOINTS 4-5-6

            for TH23=[TH23below,TH23above]
                
                % CALCULATE COORDINATES (HOMOGENOUS TRANSFORMATION) OF
                % FRAME {3} ABOUT BASE FRAME {B} FOR TH1 TH2 TH3
                AB3=DHmdfconv([RV2A.DHmdf(1,1:3),TH1])*...
                      DHmdfconv([RV2A.DHmdf(2,1:3),TH23(1)])*...
                      DHmdfconv([RV2A.DHmdf(3,1:3),TH23(2)]);
                  
                % CORDINATES FOR WRIST FRAME ABOUT FRAME {3}  
                A3wrist=AB3\ABW;
                A3wrist=roundOFerror(A3wrist,1e-6);
                r=A3wrist(1:3,1:3);         %GET ROTATION COORDINATE FROM HOMOGENOUS TRANSFORMATION A3Wrist
                
                %NON FLIP SOLUTION
                TH4NF=atan2d(r(3,3),-r(1,3));   %NON FLIP SOLUTION
                c4=cosd(TH4NF);
                s4=sind(TH4NF); 
                TH5NF=atan2d(-c4*r(1,3)+r(3,3)*s4,r(2,3));
                TH6NF=atan2d(-c4*r(3,1)-s4*r(1,1),-c4*r(3,2)-s4*r(1,2));
                
                TH456NF=[TH4NF,TH5NF,TH6NF];
                
                %FLIP SOLUTION
                TH456F=[TH4NF TH5NF TH6NF].*[1 -1 1]+[180 0 180];
                
                  THETA=[THETA;[TH1,TH23',TH456F]];       
                  THETA=[THETA;[TH1,TH23',TH456NF]];
            end
               
    end
    
    % PRELOCATION Q ARRAY
    Q=zeros(8,6);
    
    % CONVERT ANGLES FROM KINEMATIC MODEL TO ROBOT CONTROLER ANGLES
    for i=1:8
    Q(i,:)=THETA(i,:)-RV2A.thetaoffset';
    end
    
    % WRAP SOLUTION FOR -180 TO 180
    Q=wrapTo180(roundOFerror(Q,1e-6));
    Q=roundn(Q,-3);     
    Q=(Qcheck(Q',RV2A))';   %CHECK FOR JOINTS RANGE
    

    % FUNCTION CALCULATE ANGLE FOR SHOULDER & ELBOW OF RV2A
    function [TH23ABOVE,TH23BELOW]=ikin2link_RV2A(P)
        
        TH23ABOVE=nan(2,1);
        TH23BELOW=nan(2,1);
    
         % CHECK WORKSPACE    
         if ((L2 - L3)^2 <= (sqrt((P(x))^2 + (P(y))^2))^2 &&...
            (sqrt((P(x))^2 + (P(y))^2))^2 <= (L2 + L3)^2)
    
    
        beta=atan2d(P(y) , P(x));
    
        % PSI ANGLE OF TRIANGLE
        cpsi=(( P(x)^2 + P(y)^2  + (L2)^2 - (L3)^2 ) / (2 * L2 *sqrt( P(x)^2 + P(y)^2 )));
        psi=atan2d(sqrt(1-cpsi^2) , cpsi );
    
        % OMEGA ANGLE
        comega= ( L2^2 - P(x)^2 - P(y)^2 + L3^2)/2/L2/sqrt(L3^2);
        omega=atan2d(sqrt(1-comega^2) ,comega);
    

        % THETA2,3 ABOVE
        TH23ABOVE=[ (beta-psi) ; (180-omega-atand(250/130)) ];
   
        % THETA2,3 BELOW
        TH23BELOW=[ (beta+psi) ; (180+omega-atand(250/130)) ];


        end


    end
    
    Q5=Q(:,5);
    if any(Q5(~isnan(Q5))==0)
            disp('--------------------------------------------------------------');
            disp('SINGULARITY FOR WRIST')
            disp('J6 ANGLE IS SUMMARY OF J6+J4 ANGLES, J4=0')
            disp('--------------------------------------------------------------');
    end
%     warning('on','all');
%     warning;    
 
end

 
    
    
    
    