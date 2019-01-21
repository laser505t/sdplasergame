%finds a player's sphinx to get set up for lase

for row = 1:boardHeight
    for col = 1:boardWidth
        if boardModel(row, col, 3) == currentPlayer
            if boardModel(row, col, 1) == pSphx
                source = true;
                currCoords = [row, col];
                laserOrient = boardModel(row, col, 2) - 100; %make this better
            end
        end
    end
end