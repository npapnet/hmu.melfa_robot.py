function [reply]=SAVE_CURRENT_POSITION(nop)
%c1,2,3,4,5,6->x,y,z,A,B,C > for cartesian coordinates]

%c1,2,3,4,5,6->J1:6> for JOINTS coordinates]
%
%���������� ��� ������ ���� ��� ��������� ��� ������ 
%�� ����� ��� ������� �� ������ �� ���� �� ���������
%�� ����� ������ �� ������ P �������� ��  ���� P_CURR
%���������� ��� �� ���� ��� �������� ������ J >> J_CURR



if nop(1)=='P'
    
      cmd=['1;1;EXEC ' nop ' = P_CURR'];
            reply=SendCmd(cmd);

elseif nop(1)=='J'
    
    cmd=['1;1;EXEC ' nop ' = J_CURR'];
      reply=SendCmd(cmd);
      
else
    disp('lathos onoma ws orisma, >????<><><><??????')

end