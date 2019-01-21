%this game is essentially Khet, a laser game similar-ish to chess
%created by: Tyler Harris
%script for setting up the variables for the game

%TODO: create scripts to read in custom configurations of things

%move order, multiple players, variable board size

%board size
boardWidth = 10;
boardHeight = 8;

%directions
lN = 101;
lE = 102;
lS = 103;
lW = 104;

%piece types
pNone = 1000; %none
pAnub = 1100; %anubis
pPhar = 1200; %pharaoh
pPyr = 1300; %pyramid
pScr = 1400; %scarab
pSphx = 1500; %sphinx

%piece orientations
oX = 200; %for unoccupied space
oN = 201; %N/NE
oE = 202; %E/SE
oS = 203; %S/SW
oW = 204; %W/NW

%color/ownership
cX = 6000; %not owned
cS = 6001; %silver owned
cR = 6002; %red owned

%order of play
playOrder = [cS, cR];

%default unoccupied space
default = [pNone, oX, cX];

%Sprites... kinda
packSubdir = "img/";
packSize = 128;
%importing bmp images from /img subdir, both colors
%can have a different pack of images that look better than mine, just by
%using a different directory and changing packSubdir and packSize
%(resolution)
iAnubE_G = imread(char(packSubdir + "AnubE_G.bmp"));
iAnubE_R = imread(char(packSubdir + "AnubE_R.bmp"));
iAnubN_G = imread(char(packSubdir + "AnubN_G.bmp"));
iAnubN_R = imread(char(packSubdir + "AnubN_R.bmp"));
iAnubS_G = imread(char(packSubdir + "AnubS_G.bmp"));
iAnubS_R = imread(char(packSubdir + "AnubS_R.bmp"));
iAnubW_G = imread(char(packSubdir + "AnubW_G.bmp"));
iAnubW_R = imread(char(packSubdir + "AnubW_R.bmp"));
iEmpty = imread(char(packSubdir + "Empty.bmp"));
iPharE_G = imread(char(packSubdir + "PharE_G.bmp"));
iPharE_R = imread(char(packSubdir + "PharE_R.bmp"));
iPharN_G = imread(char(packSubdir + "PharN_G.bmp"));
iPharN_R = imread(char(packSubdir + "PharN_R.bmp"));
iPharS_G = imread(char(packSubdir + "PharS_G.bmp"));
iPharS_R = imread(char(packSubdir + "PharS_R.bmp"));
iPharW_G = imread(char(packSubdir + "PharW_G.bmp"));
iPharW_R = imread(char(packSubdir + "PharW_R.bmp"));
iPyrNE_G = imread(char(packSubdir + "PyrNE_G.bmp"));
iPyrNE_R = imread(char(packSubdir + "PyrNE_R.bmp"));
iPyrNW_G = imread(char(packSubdir + "PyrNW_G.bmp"));
iPyrNW_R = imread(char(packSubdir + "PyrNW_R.bmp"));
iPyrSE_G = imread(char(packSubdir + "PyrSE_G.bmp"));
iPyrSE_R = imread(char(packSubdir + "PyrSE_R.bmp"));
iPyrSW_G = imread(char(packSubdir + "PyrSW_G.bmp"));
iPyrSW_R = imread(char(packSubdir + "PyrSW_R.bmp"));
iRedOnly = imread(char(packSubdir + "RedOnly.bmp"));
iSilverOnly = imread(char(packSubdir + "SilverOnly.bmp"));
iScrNE_G = imread(char(packSubdir + "ScrNE_G.bmp"));
iScrNE_R = imread(char(packSubdir + "ScrNE_R.bmp"));
iScrNW_G = imread(char(packSubdir + "ScrNW_G.bmp"));
iScrNW_R = imread(char(packSubdir + "ScrNW_R.bmp"));
iScrSE_G = imread(char(packSubdir + "ScrSE_G.bmp"));
iScrSE_R = imread(char(packSubdir + "ScrSE_R.bmp"));
iScrSW_G = imread(char(packSubdir + "ScrSW_G.bmp"));
iScrSW_R = imread(char(packSubdir + "ScrSW_R.bmp"));
iSphxE_G = imread(char(packSubdir + "SphxE_G.bmp"));
iSphxE_R = imread(char(packSubdir + "SphxE_R.bmp"));
iSphxN_G = imread(char(packSubdir + "SphxN_G.bmp"));
iSphxN_R = imread(char(packSubdir + "SphxN_R.bmp"));
iSphxS_G = imread(char(packSubdir + "SphxS_G.bmp"));
iSphxS_R = imread(char(packSubdir + "SphxS_R.bmp"));
iSphxW_G = imread(char(packSubdir + "SphxW_G.bmp"));
iSphxW_R = imread(char(packSubdir + "SphxW_R.bmp"));

%Un/allowed spaces: red, silver, sphinx
anyPlayerAllowed = 8000;
silverOnly = 8001;
redOnly = 8002;
anyPieceAllowed = 9000;
sphinxOnly = 9001;

%board model
%board(row, col, x)
%x = 1: piece type
%    2: orientation
%    3: color/owner
%    4: piece restrictions: yet to be implemented fully
%    5: player restrictions: yet to be implemented fully
boardModel(boardHeight,boardWidth,5) = 0;
boardModel(:,:,1) = pNone;
boardModel(:,:,2) = oX;
boardModel(:,:,3) = cX;
boardModel(:,:,4) = anyPlayerAllowed;
boardModel(:,:,5) = anyPieceAllowed;

%board view
boardView = cell(boardHeight,boardWidth);

defaultPlayerRestrictions(8,10) = 0;
defaultPlayerRestrictions(:,:) = anyPlayerAllowed;
defaultPlayerRestrictions(:,1) = redOnly;
defaultPlayerRestrictions(:,10) = silverOnly;
defaultPlayerRestrictions(1,2) = silverOnly;
defaultPlayerRestrictions(8,2) = silverOnly;
defaultPlayerRestrictions(1,9) = redOnly;
defaultPlayerRestrictions(8,9) = redOnly;

defaultPieceRestrictions(8,10) = 0;
defaultPieceRestrictions(:,:) = anyPieceAllowed;
defaultPieceRestrictions(8,10) = sphinxOnly;
defaultPieceRestrictions(1,1) = sphinxOnly;

%Setups
%classic (8x10)
classicSetup(8,10,5) = 0;
classicSetup(:,:,1) = [pSphx, pNone, pNone, pNone, pAnub, pPhar, pAnub, pPyr, pNone, pNone;
                       pNone, pNone, pPyr, pNone, pNone, pNone, pNone, pNone, pNone, pNone;
                       pNone, pNone, pNone, pPyr, pNone, pNone, pNone, pNone, pNone, pNone;
                       pPyr, pNone, pPyr, pNone, pScr, pScr, pNone, pPyr, pNone, pPyr;
                       pPyr, pNone, pPyr, pNone, pScr, pScr, pNone, pPyr, pNone, pPyr;
                       pNone, pNone, pNone, pNone, pNone, pNone, pPyr, pNone, pNone, pNone;
                       pNone, pNone, pNone, pNone, pNone, pNone, pNone, pPyr, pNone, pNone;
                       pNone, pNone, pPyr, pAnub, pPhar, pAnub, pNone, pNone, pNone, pSphx];
classicSetup(:,:,2) = [oS, oX, oX, oX, oS, oS, oS, oE, oX, oX;
                       oX, oX, oS, oX, oX, oX, oX, oX, oX, oX;
                       oX, oX, oX, oW, oX, oX, oX, oX, oX, oX;
                       oN, oX, oS, oX, oW, oN, oX, oE, oX, oW;
                       oE, oX, oW, oX, oS, oE, oX, oN, oX, oS;
                       oX, oX, oX, oX, oX, oX, oE, oX, oX, oX;
                       oX, oX, oX, oX, oX, oX, oX, oN, oX, oX;
                       oX, oX, oW, oN, oN, oN, oX, oX, oX, oN];
classicSetup(:,:,3) = [cR, cX, cX, cX, cR, cR, cR, cR, cX, cX;
                       cX, cX, cR, cX, cX, cX, cX, cX, cX, cX;
                       cX, cX, cX, cS, cX, cX, cX, cX, cX, cX;
                       cR, cX, cS, cX, cR, cR, cX, cR, cX, cS;
                       cR, cX, cS, cX, cS, cS, cX, cR, cX, cS;
                       cX, cX, cX, cX, cX, cX, cR, cX, cX, cX;
                       cX, cX, cX, cX, cX, cX, cX, cS, cX, cX;
                       cX, cX, cS, cS, cS, cS, cX, cX, cX, cS];
classicSetup(:,:,4) = defaultPieceRestrictions;
classicSetup(:,:,5) = defaultPlayerRestrictions;

%dynasty
%imhotep

%laser path variable
%multiple rows of [startRow, startCol, endRow, endCol]
lPath = [];

%other laser vars
lDead = false;
laserOrient = lN;
source = true;
currCoords = [0, 0];

%def
winner = cX;