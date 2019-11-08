function A0T=fkin3(Jrc,robot)   %opou Jrc > oi gwnies pou didonte sto controler tou robot kai oxi oi gwnies tou modelou kata DH


% ελεγχος αν το το αποτελεσμα του παραπάνω ελέγχου είναι θετικό και επίλυση του ευθυ κινηματικού


theta=Jrc+robot.thetaoffset;



AB1=DHmdfconv([robot.DHmdf(1,1:3),theta(1)]);
A12=DHmdfconv([robot.DHmdf(2,1:3),theta(2)]);
A23=DHmdfconv([robot.DHmdf(3,1:3),theta(3)]);
A34=DHmdfconv([robot.DHmdf(4,1:3),theta(4)]);
A45=DHmdfconv([robot.DHmdf(5,1:3),theta(5)]);
A56=DHmdfconv([robot.DHmdf(6,1:3),theta(6)]);

A0T=robot.BASE * AB1 * A12 * A23 * A34 *...
        A45 * A56 * robot.AWF * robot.TOOL;
    
end
