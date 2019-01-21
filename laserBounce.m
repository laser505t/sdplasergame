%hope to make it a recursive script to allow for eye of horus
%(beamsplitter)

%this should be considered a pseudo-function, because it takes in variables
%and makes changes, but still has access to the entire workspace

%adds a new set of coordinates to lPath based on where the laser is coming
%in and what piece is there

%requires: current coords to be set, source to be true, and laser
%orientation to be set

%resetting stuff
lDead = false;
pDead = false;

if source
    %get starting orientation
    %add to path
    %change source to false
    %set current coords to previous coords
    prevCoords = currCoords;
    switch laserOrient
        case lN
            currCoords = [currCoords(1) - 1, currCoords(2)];
        case lE
            currCoords = [currCoords(1), currCoords(2) + 1];
        case lS
            currCoords = [currCoords(1) + 1, currCoords(2)];
        case lW
            currCoords = [currCoords(1), currCoords(2) - 1];
    end
    lPath = [lPath; prevCoords, currCoords];
    source = false;
else
    %get previous coordintates
    %get current coordinates
    %get current piece and orientation based on current coords
    %determine ending coordinates
    %if dead, set dead to true (knowing current coords, piece removed elsewhere)
    if currCoords(1) > prevCoords(1)
        laserOrient = lS;
    elseif currCoords(1) < prevCoords(1)
        laserOrient = lN;
    elseif currCoords(2) > prevCoords(2)
        laserOrient = lE;
    elseif currCoords(2) < prevCoords(2)
        laserOrient = lW;
    end
    
    switch boardModel(currCoords(1), currCoords(2), 1) %do stuff based on piece
        case pNone
            %set prevCoords to currCoords
            %set currCoords to new values
            %add to path
            prevCoords = currCoords;
            switch laserOrient
                case lN
                    currCoords = [currCoords(1) - 1, currCoords(2)];
                case lE
                    currCoords = [currCoords(1), currCoords(2) + 1];
                case lS
                    currCoords = [currCoords(1) + 1, currCoords(2)];
                case lW
                    currCoords = [currCoords(1), currCoords(2) - 1];
            end
            lPath = [lPath; prevCoords, currCoords];
        case pAnub
            %dead laser, but check if piece is dead
            pDead = true; %dead by default, but checks otherwise
            if boardModel(currCoords(1), currCoords(2), 2) == oN && laserOrient == lS
                pDead = false;
            elseif boardModel(currCoords(1), currCoords(2), 2) == oE && laserOrient == lW
                pDead = false;
            elseif boardModel(currCoords(1), currCoords(2), 2) == oS && laserOrient == lN
                pDead = false;
            elseif boardModel(currCoords(1), currCoords(2), 2) == oW && laserOrient == lE
                pDead = false;
            end
            lDead = true;
        case pPhar
            %dead laser and dead piece (game over elsewhere in code)
            lDead = true;
            pDead = true;
        case pPyr
            %reflections and maybe dead piece/laser
            prevCoords = currCoords;
            switch laserOrient
                case lN
                    if boardModel(currCoords(1), currCoords(2), 2) == oE
                        laserOrient = lE;
                        currCoords = [currCoords(1), currCoords(2) + 1];
                        lPath = [lPath; prevCoords, currCoords];
                    elseif boardModel(currCoords(1), currCoords(2), 2) == oS
                        laserOrient = lW;
                        currCoords = [currCoords(1), currCoords(2) - 1];
                        lPath = [lPath; prevCoords, currCoords];
                    else
                        lDead = true;
                        pDead = true;
                    end
                case lE
                    if boardModel(currCoords(1), currCoords(2), 2) == oS
                        laserOrient = lS;
                        currCoords = [currCoords(1) + 1, currCoords(2)];
                        lPath = [lPath; prevCoords, currCoords];
                    elseif boardModel(currCoords(1), currCoords(2), 2) == oW
                        laserOrient = lN;
                        currCoords = [currCoords(1) - 1, currCoords(2)];
                        lPath = [lPath; prevCoords, currCoords];
                    else
                        lDead = true;
                        pDead = true;
                    end
                case lS
                    if boardModel(currCoords(1), currCoords(2), 2) == oN
                        laserOrient = lE;
                        currCoords = [currCoords(1), currCoords(2) + 1];
                        lPath = [lPath; prevCoords, currCoords];
                    elseif boardModel(currCoords(1), currCoords(2), 2) == oW
                        laserOrient = lW;
                        currCoords = [currCoords(1), currCoords(2) - 1];
                        lPath = [lPath; prevCoords, currCoords];
                    else
                        lDead = true;
                        pDead = true;
                    end
                case lW
                    if boardModel(currCoords(1), currCoords(2), 2) == oN
                        laserOrient = lN;
                        currCoords = [currCoords(1) - 1, currCoords(2)];
                        lPath = [lPath; prevCoords, currCoords];
                    elseif boardModel(currCoords(1), currCoords(2), 2) == oE
                        laserOrient = lS;
                        currCoords = [currCoords(1) + 1, currCoords(2)];
                        lPath = [lPath; prevCoords, currCoords];
                    else
                        lDead = true;
                        pDead = true;
                    end
            end
        case pScr
            %reflections
            prevCoords = currCoords;
            switch laserOrient
                case lN
                    if boardModel(currCoords(1), currCoords(2), 2) == oN || boardModel(currCoords(1), currCoords(2), 2) == oS
                        laserOrient = lE;
                        currCoords = [currCoords(1), currCoords(2) + 1];
                    else
                        laserOrient = lW;
                        currCoords = [currCoords(1), currCoords(2) - 1];
                    end
                case lE
                    if boardModel(currCoords(1), currCoords(2), 2) == oN || boardModel(currCoords(1), currCoords(2), 2) == oS
                        laserOrient = lN;
                        currCoords = [currCoords(1) - 1, currCoords(2)];
                    else
                        laserOrient = lS;
                        currCoords = [currCoords(1) + 1, currCoords(2)];
                    end
                case lS
                    if boardModel(currCoords(1), currCoords(2), 2) == oN || boardModel(currCoords(1), currCoords(2), 2) == oS
                        laserOrient = lW;
                        currCoords = [currCoords(1), currCoords(2) - 1];
                    else
                        laserOrient = lE;
                        currCoords = [currCoords(1), currCoords(2) + 1];
                    end
                case lW
                    if boardModel(currCoords(1), currCoords(2), 2) == oN || boardModel(currCoords(1), currCoords(2), 2) == oS
                        laserOrient = lS;
                        currCoords = [currCoords(1) + 1, currCoords(2)];
                    else
                        laserOrient = lN;
                        currCoords = [currCoords(1) - 1, currCoords(2)];
                    end
            end
            lPath = [lPath; prevCoords, currCoords];
        case pSphx
            %dead, but piece can't die
            lDead = true;
    end
end

%checking for off board
if (currCoords(1) > boardHeight || currCoords(1) < 1) || (currCoords(2) > boardWidth || currCoords(2) < 1)
    lDead = true;
end

%another script to determine if piece will be removed, or if game over
%clear currCoords and prevCoords
%path will need to be cleared eventually
%lDead will need to be reset after removing piece