% INVERSE KINEMATIC FOR SPHERICAL WRIST / JOINT
% INVERSE SOLUTION FOR ORIENTATION
% PIEPER SOLUTION  

function [q4n, q4f, q5n, q5f, q6n, q6f] = inv_spherical_wrist(A4W)
% display(A4W)
    % A4W = A46 ��������������� �������� ������ �� ����� �� initial ������� 4�� ��������

%     A4W= inv(AB4)*ABW; %   A4W = AB4 \ ABW
%     
    % �� �������� ��������������� ���������� ��� EULER ZYZ R(�,�,�)��� = R(�4,�5,�6)ZYZ

    %NON FLIP
q4=atan2d( A4W(2,3), A4W(1,3));     
q5=atan2d(A4W(1,3)*cosd(q4)+ A4W(2,3)*sind(q4),A4W(3,3));
q6=atan2d(-A4W(1,1)*sind(q4)+A4W(2,1)*cosd(q4),-A4W(1,2)*sind(q4) + A4W(2,2)*cosd(q4));
%proxeiro disp

% https://cw.felk.cvut.cz/wiki/help/common/robot_mitsubishi_rv-6s

% 
% disp(tr2eul(A4W,'deg'));
% disp(tr2eul(A4W,'deg','flip'));
%PARAPANW TR2EUL(A4W);
%% --������ ������ ZYZ--------------------------------------------------------
%O��� sin(�)=0 ������ ������� ������ ��� ���� ������� �������� �� ���������� �� �=0
if (q5==0)
  q4=0;
  q6=atan2d(-A(1,2),A(1,1));
elseif (q5==180)
  q4=0;
  q6=atan2d(A(1,2),-A(1,1));
end

%������� ��������������� ������� �������, ������ Euler 
%������� ������� ���� ��� ��������� ����� 
%��. �������� �������
%���������� ����������� ��������� eclass

   
%% -------------------------------------------------------------------
% theta456N=[theta4+180, theta5 , theta6+180];   %NA DIORHWSW
q4n=q4+180;
q5n=q5;
q6n=q6+180;

%FLIP
q4f=q4;
q5f=-q5;
q6f=q6;


end