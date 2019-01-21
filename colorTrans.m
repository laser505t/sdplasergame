%translates a player color int to a string with the color

switch colorVar
    case cX
        colorName = 'generic';
    case cR
        colorName = 'red';
    case cS
        colorName = 'silver';
    otherwise
        colorName = 'unknown';
end