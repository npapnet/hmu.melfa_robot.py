function MatrixTr = translate(x,y,z)


%% NA ALAKSW ONOMA Matrix , na dexete orismata memonomena || pinaka syntetagmenwn thesis
% x=10; y=22; z=100;  % dokimastikes metatopiseis

%%
% tic
% MatrixTr=eye(4);
% MatrixTr(1,4)=x;
% MatrixTr(2,4)=y;
% MatrixTr(3,4)=z;
% toc

%% Analutika

MatrixTr=[1 0 0 x;
          0 1 0 y;
          0 0 1 z;
          0 0 0 1];



end

