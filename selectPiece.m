%pick piece to be moved

%requires: currentPlayer to be set properly

selectionSucceeded = false;
while selectionSucceeded == false
    fprintf('Format: [row, column]\n')
    selectedPiece = input('Which piece do you want to move? ');
    sizeArray = size(selectedPiece);
    if sizeArray(1) == 1 && sizeArray(2) == 2
        if boardModel(selectedPiece(1), selectedPiece(2), 3) == currentPlayer
            selectionSucceeded = true;
        else
            fprintf('Not your piece!\n');
        end
    else
        fprintf('Selection failed.\n')
    end
end