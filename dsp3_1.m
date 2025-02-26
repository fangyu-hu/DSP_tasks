b=[1,-2,1,0,0];
a=[1,0,1.76,0,6.25];
[sos,g]=tf2sos(b,a)

[r,p,k]=residuez(b,a)
[b1,a1]=residuez(r(1:2),p(1:2),[])
[b2,a2]=residuez(r(3:4),p(3:4),[])