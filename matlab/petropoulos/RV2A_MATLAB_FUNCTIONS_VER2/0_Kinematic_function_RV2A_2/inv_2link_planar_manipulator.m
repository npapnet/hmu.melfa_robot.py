% http://www.eng.utah.edu/~cs5310/chapter5.pdf
% 
% Inverse Kinematics for Position
% Two-link Planar Manipulator
% 
% 
% % ���������� ������� ����������� ����������� ��� ������� �������� 2 �����
% L1 ��� L2
% ��� 2 ������������� ���������
% �� ���� ����������� ������ ��������� ���������������

function [q1above, q1below, q2above, q2below ]=inv_2link_planar_manipulator(P,L1,L2)  % P o ������� ������������� ����� ��� �����  

x=1;
y=2;

%----------------------------------------------------------
L= sqrt((P(x))^2 + (P(y))^2);                                      %=norm(P)   %

if ((L1 - L2)^2 <= L^2 && L^2 <= (L1 + L2)^2)     %����������� ������ ����������� ��� ���� ��� ����
    
    beta=atan2d(P(y) , P(x));
    
    %����������� ������ ������ �������� �1
    % ������� ����� ����������� 
    % �� ��������� ��� ������� ���� �������� ������� �� �� �������� ���
    % ���������� ��� ����� ��� ������� ����� �� �������� �������� ��� ���
    % ������� ��� �� ���������� ��� ������ ��� ����������� ������� ���� ���
    % �������
    
    cpsi=(( (P(x))^2 + (P(y))^2  + (L1)^2 - (L2)^2 ) / (2 * L1 *sqrt( (P(x))^2 + (P(y))^2 ))); % cos(�)
    spsi = sqrt(1-cpsi^2); % +/-  %sin(�)
    psi=atan2d(spsi,cpsi);
    
    q1above=beta+psi;  % ABOVE    ELBOW UP
    q1below=beta-psi;     % BELOW ELBOW DOWN
    
   %%����������� ������ 2�� �������� �2 ����� �2' ��������� ����� ��������
   %%��� ������������

    c2=( ( ( (P(x))^2 + (P(y))^2 ) - (L1)^2 - (L2)^2 ) / ( -2 * L1 * L2));  %cos(�2') 
    s2=+sqrt(1-c2^2); %+/-   %sin(�2')
    q2above =  180 + atan2d(s2,c2);%ABOVE
    q2below = 180 - atan2d(s2,c2); %ELEXTHIKE
    
    %--------------------------------------------------------
%      line([0,P(x)],[0,P(y)])
%      hold on
%      line([0 L1*cosd(q1above) L1*cosd(q1above)+L2*cosd(q1above+q2above)],...
%             [0,L1*sind(q1above) L1*sind(q1above)+L2*sind(q1above+q2above)])
%     line([0 L1*cosd(q1below) L1*cosd(q1below)+L2*cosd(q1below+q2below)],...
%             [0,L1*sind(q1below) L1*sind(q1below)+L2*sind(q1below+q2below)])
    
    
else
    %error('L^2 => (L1+L2)');
    q1above=NaN;
    q2above=NaN;
    q1below=NaN;
    q2below=NaN;
end