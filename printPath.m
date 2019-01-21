%prints path
[height, junk] = size(lPath);
for i = 1:height
    line([packSize * (lPath(i,2) - 0.5), packSize * (lPath(i,4) - 0.5)], [packSize * (lPath(i,1) - 0.5), packSize * (lPath(i,3) - 0.5)], 'Color', 'red');
end