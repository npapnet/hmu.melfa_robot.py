%Dimitris Petropoulos
%inverse kinematic for 6Revolutions Joints robot RV2A
%POSDATA ---> homogenous || General position VECTOR (X,Y,Z,A,B,C)


function [J,FLAG1,POSTURE]=invkin(POSDATA,robot)
%��������
%����� ABT < ��������������� ��������� �� ���� ���� 
%
AworldT=posData2tr(POSDATA);

global L2 L3 ABW PBW x y z 
L2=250;                                 
L3=sqrt(250^2+130^2);

%-------------------------------
x=1;
y=2;
z=3;

%-----------------�� �������� ��� �������������� robot.BASE � ���� ������
%�������� 
ABT=robot.BASE\AworldT;
ABW=ABT/robot.TOOL/robot.AWF;    % ������� ��������������� ������ �� ���� ����
PBW=ABW*[0 0 0 1]';                                         % ������� ������������� ����� ������ �� ���� ���� 

% � ��������� ��� �� 1� ������� ��� ��� ����� ������������ �� ��������
% ���������  �� ������� ������ ���� ��� �������� ��� ��� ���� ��� ��������
% ��� ������ �������� ��� ��� ������ ��� ����� ������ ��� ������� ���
% ����������� �� ������ XY ��� 1�� �������� 

% ����������� �1

q1R=atan2d(PBW(y),PBW(x));
[q2RA, q2RB, q3RA, q3RB]=inv_elb(q1R);
[q4RAN, q4RAF, q5RAN, q5RAF, q6RAN, q6RAF]=inv_wr(q1R,q2RA,q3RA);
[q4RBN, q4RBF, q5RBN, q5RBF, q6RBN, q6RBF]=inv_wr(q1R,q2RB,q3RB);


q1L=q1R+180;
[q2LA, q2LB, q3LA, q3LB]=inv_elb(q1L);
[q4LAN, q4LAF, q5LAN, q5LAF, q6LAN, q6LAF]=inv_wr(q1L,q2LA,q3LA);
[q4LBN, q4LBF, q5LBN, q5LBF, q6LBN, q6LBF]=inv_wr(q1L,q2LB,q3LB);


% RIGHT HAND inv Kinematic
% ����������� ��������� ��������������� ������ �� ���� ������ (initial )
% ������� 2�� ��������


%%  ����������� ������ �2 �3 (���� / �������)
    function [q2A, q2B, q3A, q3B ]=inv_elb(q1)

AB1=DHmdfconv([robot.DHmdf(1,1:3),q1]);
A12=DHmdfconv([robot.DHmdf(2,1:3),0]);

% P2W= AB1 * A12 \ PBW;       % P2W=AB1*A12\PWB P2W=inv(AB1*A12)*PBW    > invAB2= A2B
%  %allagi logo mirror ws pros x[q2A, q2B, q3Ain, q3Bin ]=inv_2link_planar_manipulator( P2W ,L2,L3);   % 2 link planar manipulator solution for positition
% [q2B, q2A, q3Bin, q3Ain ]=inv_2link_planar_manipulator( P2W ,L2,L3);
% q3A=q3Ain-atan2d(250,130);
% q3B=q3Bin-atan2d(250,130);

P2Wdif=(AB1\ABW)*[0 0 0 1]' - A12*[0 0 0 1]';
 [q2A, q2B, q3Ain, q3Bin ]=inv_2link_planar_manipulator( [P2Wdif(x) P2Wdif(z)] ,L2,L3);
q2A=-q2A;
q2B=-q2B;
 q3A=360-q3Ain-atan2d(250,130);
q3B=360-q3Bin-atan2d(250,130);


    end

%% ������� 4�� �������� (2� 3 ������) initial 4�� �������� ABOVE

    function [q4n, q4f, q5n, q5f, q6n, q6f]=inv_wr(q1,q2,q3)
        
%A4Wr=AB1r*A12r*A23r*A34r\ABW  %A4W=inv(AB4)*ABW  > tr2eul(A4W)*180/pi

AB1=DHmdfconv([robot.DHmdf(1,1:3),q1]);
A12=DHmdfconv([robot.DHmdf(2,1:3),q2]);
A23=DHmdfconv([robot.DHmdf(3,1:3),q3]);
A34=DHmdfconv([robot.DHmdf(4,1:3),0]);
A4W=AB1*A12*A23*A34\ABW;
 [q4n, q4f, q5n, q5f, q6n, q6f]=inv_spherical_wrist(A4W);
 
 % sugrisi me tr2eul ZYZ
 
    end
%%-----------------------------------------------------------------
     
Q(1,1:4)=q1R;
Q(1,5:8)=q1L;
Q(2,1:2)=q2RA;
Q(2,3:4)=q2RB;
Q(2,5:6)=q2LA;
Q(2,7:8)=q2LB;
Q(3,1:2)=q3RA;
Q(3,3:4)=q3RB;
Q(3,5:6)=q3LA;
Q(3,7:8)=q3LB;
Q(4,1)=q4RAN;
Q(4,2)=q4RAF;
Q(4,3)=q4RBN;
Q(4,4)=q4RBF;
Q(4,5)=q4LAN;
Q(4,6)=q4LAF;
Q(4,7)=q4LBN;
Q(4,8)=q4LBF;
Q(5,1)=q5RAN;
Q(5,2)=q5RAF;
Q(5,3)=q5RBN;
Q(5,4)=q5RBF;
Q(5,5)=q5LAN;
Q(5,6)=q5LAF;
Q(5,7)=q5LBN;
Q(5,8)=q5LBF;
%----------------------------------------
Q(6,1)=q6RAN; %(7)
Q(6,2)=q6RAF;   %(6)
Q(6,3)=q6RBN;   %(5)
Q(6,4)=q6RBF;    %(4)
Q(6,5)=q6LAN;   %(3)
Q(6,6)=q6LAF;    %(2)
Q(6,7)=q6LBN;   %(1)
Q(6,8)=q6LBF;    %(0)






for i=1:8
    Q(:,i)=Q(:,i)-robot.thetaoffset;
end

Q=wrapTo180(Q);  % ������� 6  range -200 200
%disp(Q)
for i=1:8
    if roundn(Q(5,i),-3)==0
        Q(4,i)=0;
        Q(6,i)=-0;
    end
end
Q=roundn(Q,-3);   %stogulopoiisi sto 3o dekadiko den epireazei ta oria afou einai ola akeraia 
 Q=Qcheck(Q,robot);
  
J=flipud(Q');
FLAG1=[0 1 2 3 4 5 6 7]';
POSTURE=['LBF';'LBN';'LAF';'LAN';'RBF';'RBN';'RAF';'RAN'];
%PARADEIGMA ROUND
% A = [pi exp(1) 1/7]
% Ndecimals = 2 
% f = 10.^Ndecimals 
% A = round(f*A)/A 

%ROUND OF ERROR

%     %% FROM KINEMATIC MODEL ANGLES TO ROBOT CONTROLER
%     
%     
% THETA(:,i)=THETA(:,i)-robot.thetaoffset;
% 
% AAAAA=wrapTo180(THETA)  % ������� 6  range -200 200







end