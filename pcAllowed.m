%returns whether a piece is allowed to be in a spot (going off edges,
%sphinx stuff, and other pieces around)
%assumed true otherwise

if requestCoords(1) > boardHeight || requestCoords(1) < 1 || requestCoords(2) > boardWidth || requestCoords(2) < 1
    pieceAllowed = false;
elseif boardModel(requestCoords(1), requestCoords(2), 1) ~= pNone
    pieceAllowed = false;
elseif (boardModel(selectedPiece(1), selectedPiece(2), 1) == pSphx) && (boardModel(requestCoords(1), requestCoords(2), 4) ~= sphinxOnly)
    pieceAllowed = false;
end
    