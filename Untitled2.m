images = imageSet(fullfile(toolboxdir('vision'),'visiondata','calibration','slr'));
[imagePoints, boardSize] = detectCheckerboardPoints(images.ImageLocation);
squareSize = 29;
worldPoints = generateCheckerboardPoints(boardSize,squareSize);
cameraParams = estimateCameraParameters(imagePoints,worldPoints);
imOrig = imread(fullfile(toolboxdir('vision'),'visiondata','calibration','slr','image3.jpg'));
figure; imshow(imOrig,'InitialMagnification',50);
title('Input Image');