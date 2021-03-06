function cleancub = drop_thin_cuboids(cuboidhyp, vp)

if length(cuboidhyp)==0
    cleancub = [];
end

drop = zeros(length(cuboidhyp), 1);
for i = 1:length(cuboidhyp)
    
    pt = cat(1, cuboidhyp(i).junc3.pt);
    prm = cuboid_pts2prm(pt, vp);
%     pts = cuboid_prm2pts(prm, vp);
    if prm(3)/prm(4) > 7 || ...
       prm(4)/prm(3) > 7 || ...
       prm(4)/prm(5) > 7 || ...
       prm(5)/prm(4) > 7 || ...
       prm(3)/prm(5) > 7 || ...
       prm(5)/prm(3) > 7
% aggressive (short)
%    if prm(3)/prm(4) > 5 || ...
%        prm(4)/prm(3) > 2 || ...
%        prm(4)/prm(5) > 5 || ...
%        prm(5)/prm(4) > 5 || ...
%        prm(3)/prm(5) > 5 || ...
%        prm(5)/prm(3) > 5
        drop(i) = 1;
    end
end

cleancub = cuboidhyp(~logical(drop));

