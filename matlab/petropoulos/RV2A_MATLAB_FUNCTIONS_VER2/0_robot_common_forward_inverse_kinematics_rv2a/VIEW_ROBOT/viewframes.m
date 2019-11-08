function viewframes(HTR)

%% Na dw matlab color chart gia xrwmata
R=[1 0 0];
G=[0 1 0];
B=[0 0 1];
% mporw na grapsw ta xrwmata mesa se '' me ti sunomografia tous gia ta
% basika

scaleXYZ=scaleXYZ_HTR(100,100,100);

%% mikos dianusmatos   
Xaxis_initial=scaleXYZ*[1 0 0 1]';
Yaxis_initial=scaleXYZ*[0 1 0 1]';
Zaxis_initial=scaleXYZ*[0 0 1 1]';

%% Axis after tranformation

Xaxis=HTR*Xaxis_initial;
Yaxis=HTR*Yaxis_initial;
Zaxis=HTR*Zaxis_initial;

%%

line([HTR(1,4) Xaxis(1)],[HTR(2,4) Xaxis(2)],[HTR(3,4) Xaxis(3)],'Color',R,'LineWidth',1);

line([HTR(1,4) Yaxis(1)],[HTR(2,4) Yaxis(2)],[HTR(3,4) Yaxis(3)],'Color',G,'LineWidth',1);

line([HTR(1,4) Zaxis(1)],[HTR(2,4) Zaxis(2)],[HTR(3,4) Zaxis(3)],'Color',B,'LineWidth',1);
axis([-600 600 -600 600 0 900])

% plot3([HTR(1,4) Zaxis(1)],[HTR(2,4) Zaxis(2)],[HTR(3,4) Zaxis(3)],'o','LineWidth',1,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','g',...
%                 'MarkerSize',15);

% view([-215 55]);  NA DW STEWART KINEMATICS

%% Δημιουργεί πίνακα κλίμακας 
    function [SHTR]=scaleXYZ_HTR(sx,sy,sz)
        
        SHTR=[ sx  0 0 0
                     0 sy 0 0 
                     0 0 sz 0
                     0 0 0 1];
        
    end
        
        

end

