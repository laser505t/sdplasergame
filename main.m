%main game script

round = 0;
gameOver = false;
while gameOver == false
    %pick piece, while loop until succeeds
    %pick move, while loop until succeeds
    %lase
    %print laser
    %set winner, if won
    %pick off dead piece if needed
    %increase round
    currentPlayer = playOrder(mod(round, length(playOrder)) + 1);
    colorVar = currentPlayer;
    run colorTrans
    fprintf('Player %s is up!\n', colorName)
    run printBoard
    moveSuccess = false;
    while moveSuccess == false
        run selectPiece
        run movePiece
    end
    run updView
    run printBoard
    fprintf('Any key to lase!\n');
    pause
    run findSource
    run lase
    run printPath
    pause
    if (size(deadCoords) > [0 0])
        if boardModel(deadCoords(1), deadCoords(2)) == pPhar
            winner = playOrder(mod(round, length(playOrder)) + 1);
            gameOver = true;
        else
            boardModel = rm(deadCoords(1), deadCoords(2), boardModel, default);
        end
    end
    run updView
    run printBoard
    lPath = [];
    
    round = round + 1;
end