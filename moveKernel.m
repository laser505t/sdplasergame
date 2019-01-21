%moves a piece
%this does not have any restrictions!
%angle not implemented
%df stands for defaults
function ret = moveKernel(start, finish, bModel, df)
movingPiece = bModel(start(1), start(2), 1);
movingOrient = bModel(start(1), start(2), 2);
movingOwner = bModel(start(1), start(2), 3);
bModel(finish(1), finish(2), 1) = movingPiece;
bModel(finish(1), finish(2), 2) = movingOrient;
bModel(finish(1), finish(2), 3) = movingOwner;
bModel(start(1), start(2), 1) = df(1);
bModel(start(1), start(2), 2) = df(2);
bModel(start(1), start(2), 3) = df(3);
ret = bModel;
end