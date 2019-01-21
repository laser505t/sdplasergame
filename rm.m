%removes a piece
function ret = rm(row, col, bModel, df)
bModel(row, col, 1) = df(1);
bModel(row, col, 2) = df(2);
bModel(row, col, 3) = df(3);
ret = bModel;
end