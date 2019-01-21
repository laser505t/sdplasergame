%Play the arguably best game created by a TA!

%keep settings if player wants a rematch
%quit game in middle or cancel moves in progress
%make sphinx rotation restricted!

clear

quitVar = false;
run vars
currentSetup = classicSetup;
run updView
while quitVar == false
    boardModel = currentSetup;
    run updView
    fprintf('Right now this game is only 2-player (no computer available).\n')
    fprintf('2p - play 2-player\n')
    %fprintf('t - load texture pack\n')
    fprintf('l - choose layout (defaults to classic)\n')
    fprintf('q - quit\n')
    choice = input('Choice: ','s');
    switch choice
        case '2p'
            run main
            colorVar = winner;
            run colorTrans
            fprintf('The winner is %s\n', colorName);
            winner = cX;
        case 'l'
            fprintf('Choose your setup:\n')
            fprintf('c - classic\n')
            setup = input('Setup: ','s');
            switch setup
                case 'c'
                    currentSetup = classicSetup;
                otherwise
                    currentSetup = classicSetup;
            end
        case 'q'
            quitVar = true;
    end
end
    
    