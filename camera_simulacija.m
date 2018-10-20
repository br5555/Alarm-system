 R = [1     0     0;
         0     0    -1;
         0     1     0];
     
 cam = plotCamera('Location',[10 0 20],'Orientation',R,'Opacity',0);
 grid on
    axis equal
    axis manual
    xlim([-15,20]);
    ylim([-15,20]);
    zlim([15,25]);
    
 for theta = 0:pi/64:10*pi
        T = [cos(theta)  0  sin(theta);
                0        1      0;
             -sin(theta) 0  cos(theta)];
        cam.Orientation = T * R;
        cam.Location = [10 * cos(theta),10 * sin(theta),20];
        drawnow();
 end
    
 im = undistortImage(0.5,0.5);
 [imagePoints,boardSize] = detectCheckerboardPoints(im);
 [rotationMatrix,translationVector] = extrinsics(imagePoints,worldPoints,cameraParams);
 figure;
plot3(worldPoints(:,1), worldPoints(:,2),zeros(size(worldPoints, 1),1),'*');
hold on
plot3(0,0,0,'g*');