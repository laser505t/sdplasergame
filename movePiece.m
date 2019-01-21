%script to move a piece once it is selected

%requires: selectedPiece to be set

moveSuccess = false;
while moveSuccess == false
    fprintf('Move or rotate?\n');
    fprintf('m - move\n')
    fprintf('r - rotate\n')
    fprintf('c - cancel\n')
    movOrRot = input('Choice: ','s');
    switch movOrRot
        case 'm'
            %ask for direction
            %placement restrictions
            movSel = false;
            while movSel == false
                fprintf('Which direction (wasd)?\n')
                fprintf('w - move north 1 space\n')
                fprintf('d - move east 1 space\n')
                fprintf('s - move south 1 space\n')
                fprintf('a - move west 1 space\n')
                fprintf('or combinations of these for diagonals\n')
                fprintf('c - cancel\n')
                moveChoice = input('Choice: ','s');
                playerAllowed = true;
                pieceAllowed = true;
                switch moveChoice
                    case 'w'
                        %player and piece allowed there (player restrictions, piece restrictions, edge restrictions)?
                        requestCoords = [selectedPiece(1) - 1, selectedPiece(2)];
                        run pcAllowed
                        if pieceAllowed
                            run plrAllowed
                            if playerAllowed
                                boardModel = moveKernel(selectedPiece, requestCoords, boardModel, default);
                                movSel = true;
                                moveSuccess = true;
                            else
                                fprintf('Player can''t go there.\n')
                            end
                        else
                            fprintf('Piece can''t go there.\n')
                        end
                    case 'a'
                        requestCoords = [selectedPiece(1), selectedPiece(2) - 1];
                        run pcAllowed
                        if pieceAllowed
                            run plrAllowed
                            if playerAllowed
                                boardModel = moveKernel(selectedPiece, requestCoords, boardModel, default);
                                movSel = true;
                                moveSuccess = true;
                            else
                                fprintf('Player can''t go there.\n')
                            end
                        else
                            fprintf('Piece can''t go there.\n')
                        end
                    case 's'
                        requestCoords = [selectedPiece(1) + 1, selectedPiece(2)];
                        run pcAllowed
                        if pieceAllowed
                            run plrAllowed
                            if playerAllowed
                                boardModel = moveKernel(selectedPiece, requestCoords, boardModel, default);
                                movSel = true;
                                moveSuccess = true;
                            else
                                fprintf('Player can''t go there.\n')
                            end
                        else
                            fprintf('Piece can''t go there.\n')
                        end
                    case 'd'
                        requestCoords = [selectedPiece(1), selectedPiece(2) + 1];
                        run pcAllowed
                        if pieceAllowed
                            run plrAllowed
                            if playerAllowed
                                boardModel = moveKernel(selectedPiece, requestCoords, boardModel, default);
                                movSel = true;
                                moveSuccess = true;
                            else
                                fprintf('Player can''t go there.\n')
                            end
                        else
                            fprintf('Piece can''t go there.\n')
                        end
                    case {'aw','wa'}
                        requestCoords = [selectedPiece(1) - 1, selectedPiece(2) - 1];
                        run pcAllowed
                        if pieceAllowed
                            run plrAllowed
                            if playerAllowed
                                boardModel = moveKernel(selectedPiece, requestCoords, boardModel, default);
                                movSel = true;
                                moveSuccess = true;
                            else
                                fprintf('Player can''t go there.\n')
                            end
                        else
                            fprintf('Piece can''t go there.\n')
                        end
                    case {'wd','dw'}
                        requestCoords = [selectedPiece(1) - 1, selectedPiece(2) + 1];
                        run pcAllowed
                        if pieceAllowed
                            run plrAllowed
                            if playerAllowed
                                boardModel = moveKernel(selectedPiece, requestCoords, boardModel, default);
                                movSel = true;
                                moveSuccess = true;
                            else
                                fprintf('Player can''t go there.\n')
                            end
                        else
                            fprintf('Piece can''t go there.\n')
                        end
                    case {'ds','sd'}
                        requestCoords = [selectedPiece(1) + 1, selectedPiece(2) + 1];
                        run pcAllowed
                        if pieceAllowed
                            run plrAllowed
                            if playerAllowed
                                boardModel = moveKernel(selectedPiece, requestCoords, boardModel, default);
                                movSel = true;
                                moveSuccess = true;
                            else
                                fprintf('Player can''t go there.\n')
                            end
                        else
                            fprintf('Piece can''t go there.\n')
                        end
                    case {'as','sa'}
                        requestCoords = [selectedPiece(1) + 1, selectedPiece(2) - 1];
                        run pcAllowed
                        if pieceAllowed
                            run plrAllowed
                            if playerAllowed
                                boardModel = moveKernel(selectedPiece, requestCoords, boardModel, default);
                                movSel = true;
                                moveSuccess = true;
                            else
                                fprintf('Player can''t go there.\n')
                            end
                        else
                            fprintf('Piece can''t go there.\n')
                        end
                    case 'c'
                        break;
                    otherwise
                        fprintf('Invalid.')
                end
            end
        case 'r'
            %ask for direction and do it (sphinx restrictions?)
            rotSel = false;
            while rotSel == false
                rotationChoice = input('Which direction (l or r or c to cancel)? ','s');
                switch rotationChoice
                    case 'l'
                        boardModel(selectedPiece(1), selectedPiece(2), 2) = rot(-1, boardModel(selectedPiece(1), selectedPiece(2), 2));
                        rotSel = true;
                        moveSuccess = true;
                    case 'r'
                        boardModel(selectedPiece(1), selectedPiece(2), 2) = rot(1, boardModel(selectedPiece(1), selectedPiece(2), 2));
                        rotSel = true;
                        moveSuccess = true;
                    case 'c'
                        break;
                    otherwise
                        fprintf('Invalid.\n')
                end
            end
        case 'c'
            break; %NEEDS TO BACK TO LAST SCRIPT!!!
        otherwise
            fprintf('Invalid.');
    end
end