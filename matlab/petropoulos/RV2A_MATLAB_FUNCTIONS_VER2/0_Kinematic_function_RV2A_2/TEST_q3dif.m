x=1;
y=2;
z=3;
L2=250;
L3=sqrt(250^2+130^2)


P2Wdif=[  84.4931
 -437.1556
    0.0000
    1.0000]

[q2Adif, q2Bdif, q3Aindif, q3Bindif ]=inv_2link_planar_manipulator( [P2Wdif(x) -P2Wdif(z)] ,L2,L3);
q3Adif=wrapTo180(360-q3Aindif-atan2d(250,130)+90-RV2A.thetaoffset(3))
q3Bdif=wrapTo180(q3Aindif-atan2d(250,130)+90-RV2A.thetaoffset(3))

[ -284.4931
 -437.1556
   -0.0000
    1.0000]