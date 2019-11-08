function Serial_links_mechanism_skeleton_model(A)


[~,n]=size(A);

x=1;
y=2;
z=3;

    
Aprev=A{1};
Pprev=Aprev*[0 0 0 1]';

viewframes(Aprev)
hold on
grid on



for linkno=2:n
    
	Aw=Aprev*A{linkno};
	P{linkno}=Aw*[0 0 0 1]';
  
    line([Pprev(x) P{linkno}(x)],[Pprev(y) P{linkno}(y)],[Pprev(z) P{linkno}(z)],'Linewidth',2,'color',[0 0 0]);
    plot3(P{linkno}(x) , P{linkno}(y) , P{linkno}(z) ,'.','Color',[1 0 0]);

    % viewframes(Aprev);

    Aprev=Aw;
    Pprev=P{linkno};
    viewframes(Aprev);
    viewJoints(Aprev);
     
end

end


  