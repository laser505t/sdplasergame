%sets whether or not a player is allowed in a certain spot

allowance = boardModel(requestCoords(1), requestCoords(2), 5);
playerAllowed = false;
if allowance == anyPlayerAllowed
    playerAllowed = true;
elseif currentPlayer == cR
    if allowance == redOnly
        playerAllowed = true;
    end
elseif currentPlayer == cS
    if allowance == silverOnly
        playerAllowed = true;
    end
end