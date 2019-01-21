%make this not stupid

function endOrientation = rot(changeAngle, currentOrientation)
currentAngle = currentOrientation - 200;
endAngle = mod(currentAngle + changeAngle, 4);
if endAngle == 0
    endAngle = 4;
end
endOrientation = endAngle + 200;