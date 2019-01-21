%prints the figure according to the view model
figure(1);
imshow([
    boardView{1,:};
    boardView{2,:};
    boardView{3,:};
    boardView{4,:};
    boardView{5,:};
    boardView{6,:};
    boardView{7,:};
    boardView{8,:};
], 'InitialMagnification','fit');
%figure out how to make the rows and columns clear to the user