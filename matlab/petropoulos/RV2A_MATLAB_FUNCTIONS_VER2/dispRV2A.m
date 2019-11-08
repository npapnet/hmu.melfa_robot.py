function dispRV2A(A,varargin)
opt.workspace = false;
opt = tb_optparse(opt, varargin);

 
COLOR(1,:)=[0.717,0.116,0.123]; %BASE
COLOR(2,:)=[0.216,1,.583];    
COLOR(3,:)=[0.306,0.733,1];
COLOR(4,:)=[1,0.542,0.493];
COLOR(5,:)=[0.216,1,.583];
COLOR(6,:)=[1,1,0.255];
COLOR(7,:)=[0.306,0.733,1];     %flange link 6
% COLOR(1,:)=[0.4 0.4 0.4]
% COLOR(2,:)=[1 1 0.4]
% COLOR(3,:)=[1 1 0.4]
% COLOR(4,:)=[1 1 0.4]
% COLOR(5,:)=[1 1 0.4]
% COLOR(6,:)=[1 1 0.4]
% COLOR(7,:)=[0 0 0]

global RV2A

%% PLOT FLOOR
%-------------------------------------------------------------------------

X=-600:200:600;
Y=X;
[X,Y]=meshgrid(X,Y);
Z=zeros(size(Y));
    Xn=A{1}(1,4) + A{1}(1,1).*X + A{1}(1,2).*Y + A{1}(1,3).*Z;
    Yn=A{1}(2,4) + A{1}(2,1).*X + A{1}(2,2).*Y + A{1}(2,3).*Z;
    Zn=A{1}(3,4) + A{1}(3,1).*X + A{1}(3,2).*Y + A{1}(3,3).*Z;
surf(Xn,Yn,Zn,'FaceColor','none','edgecolor','none');
viewframes(A{1},[400,400,400]);
%------------------------

%-------------------------------------------------------------------------
%% PLOT WORKSPACE
if opt.workspace
WORKSPACE=RV2A.STL.WORKSPACE;
C=WORKSPACE.vertices;
WORKSPACE.vertices=[A{1}(1,4) + A{1}(1,1)*C(:,1) + A{1}(1,2)*C(:,2) + A{1}(1,3)*C(:,3),...
    A{1}(2,4) + A{1}(2,1)*C(:,1) + A{1}(2,2)*C(:,2) + A{1}(2,3)*C(:,3),...
    A{1}(3,4) + A{1}(3,1)*C(:,1) + A{1}(3,2)*C(:,2) + A{1}(3,3)*C(:,3)];

patch(WORKSPACE,'FaceColor',       [0.4 0.8 0.6], ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'faceAlpha', .15,...
         'AmbientStrength', 0.15);
end
%-------------------------------------------------------------------------
r=eye(4);

%% PLOT LINKS
for link=[1 2 3 4 5 6 7]

    r=r*A{link};
    C=RV2A.STL.LINKS{link}.vertices;
    LINK=RV2A.STL.LINKS{link};
    LINK.vertices=[r(1,4) + r(1,1)*C(:,1) + r(1,2)*C(:,2) + r(1,3)*C(:,3),...
    r(2,4) + r(2,1)*C(:,1) + r(2,2)*C(:,2) + r(2,3)*C(:,3),...
    r(3,4) + r(3,1)*C(:,1) + r(3,2)*C(:,2) + r(3,3)*C(:,3)];

patch(LINK,'FaceColor',       COLOR(link,:), ...
         'EdgeColor',       'none',        ...
         'FaceLighting',    'gouraud',     ...
         'AmbientStrength', 0.15);
hold on
end
viewframes(r*A{8}*A{9},[250,250,250]) % PLOT TOOL FRAME

%% PLOT PROPERTIES 
% Fix the axes scaling, and set a nice view angle
% Add a camera light, and tone down the specular highlighting
%camlight('headlight');
%material('dull');
%Grid settings
grid on
set(gca,'GridLineStyle','-');
set(gca,'XColor','k','YColor','k','ZColor','k');
% XL = get(gca, 'XLim');
% YL = get(gca, 'YLim');
% ZL = get(gca, 'ZLim');
set(gca,'Xtick',-2000:200:2000)
set(gca,'Ytick',-2000:200:2000)
set(gca,'Ztick',-2000:200:2000)
light
axis('image');
view(170,35)
end