%% 输入参数
b1=[-14.75,-12.90,0];
a1=[1,-7/8,3/32];
b2=[24.50,26.82,0];
a2=[1,-1,0.5];
%% 并联型
[r1,p1,k1]=residuez(b1,a1);
[r2,p2,k2]=residuez(b2,a2); 
%% 把零点和极点重新整合
r=[r1',r2']; %转置
p=[p1',p2'];
%并联转直接型
[b,a]=residuez(r,p,[])